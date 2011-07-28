class PostsController < ApplicationController
  before_filter :authenticate_user!, :alert => 'You must be logged in to continue'
	load_and_authorize_resource

	# GET /posts
  # GET /posts.xml
  def index
    @posts = Post.order('id').page(params[:page]).per(5)
    @user = current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
   @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.name = @post.user.name

    #THE NUMBERS WORK!
    @post.accuracy_ratio = 1 #every post has a good start
    @post.accuracy_percent = 100

    @post.accuracy= 13 
    @post.inaccuracy= 12
    @post.pageviews = 9001 
    @post.trending_value = 1337

    #TODO: update_status doesn't work?
    #update_status
        
    @post.tag_list.clear
    @post.tag_list << 'politics' if params[:post][:politics]
    @post.tag_list << 'tech' if params[:post][:tech]
    @post.tag_list << 'entertainment' if params[:post][:entertainment]
    @post.tag_list << 'sports' if params[:post][:sports]
    @post.tag_list << 'science' if params[:post][:science]
    @post.tag_list << 'crime' if params[:post][:crime]
    @post.tag_list << 'business' if params[:post][:business]
    @post.tag_list << 'social' if params[:post][:social]
    @post.tag_list << 'nature' if params[:post][:nature]
    @post.tag_list << 'other' if params[:post][:other]
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(:action=>'index')
    
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }

      format.js { redirect_to(posts_url) }
    end
  end

  # Jon's vote code -- may be glitchy

  def check_votes_users #searches to see if you have voted on it before
    $voted_up = false
    $voted_down = false

    @post.users_who_voted_up_array.each do |u|
      if (@user == u)
        $voted_up = true
      end
    end

   @post.users_who_voted_up_array.each do |u|
     if (@user == u)
        $voted_down = true
     end
    end
    
  end

  def vote_up
    #simplified for testing
    @post.vote_up
    #@post.accuracy+=1
    #render :text => @post.accuracy
    
    redirect_to(:action=>'index')
    
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }

      format.js { redirect_to(posts_url) }
    end    
#    check_votes_users
#
#    if !$voted_up and !$voted_down #TODO: how to set it so this boolean maps to individual users?
#      #should there be an array that indexes "users who voted on this post"?
#    @post.accuracy += 1
#    $voted_down = false
#    $voted_up = true
#    @user.posts_upvoted_array << (@post.id)
#
#    elsif $voted_down #allow vote changes
#    @post.inaccuracy -= 1
#    @post.accuracy += 1
#    $voted_down = false
#    $voted_up = true
#
#    @user.posts_upvoted_array << (@post.id)
#    @user.posts_downvoted_array.delete(@post.id)
#    end
#    update_status

    
    
  end

  def vote_down
    
    @post.vote_down
    #@post.inaccuracy += 1
    #render :text => @post.inaccuracy
    redirect_to(:action=>'index')
    
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }

      format.js { redirect_to(posts_url) }
    end    
#    check_votes_users
#    
#    if !$voted_up and !$voted_down
#    @post.inaccuracy += 1
#    $voted_down = true
#    $voted_up = false
#    @user.posts_downvoted_array << (@post.id)
#
#    elsif $voted_up
#    @post.inaccuracy += 1
#    @post.accuracy -= 1
#    $voted_down = true
#    $voted_up = false
#
#    @user.posts_downvoted_array << (@post.id)
#    @user.posts_upvoted_array.delete(@post.id)
#    
#    end
#    update_status

  end

  def update_status
    @post.total_votes = @post.accuracy + @post.inaccuracy

    if @post.total_votes == 0
    @post.accuracy_percent = 100
    else
    @post.accuracy_percent = (@post.accuracy/@post.total_votes)*100
    end
    # here is the amazing trending value algorithm
    # TODO: pageview counter, time_effective counter

    if @post.total_votes == 0
      tv = 1
    elsif (log(@post.total_votes)<1)
      tv=1
    else
      tv = log(@post.total_votes)
    end
    
    if @post.pageviews == 0
      pv = 1
    elsif log(@post.pageviews)<1
      pv=1
    else
      pv = log(@post.pageviews)
    end

    
    set_trending_value!
    post_update_karma

    # TODO: does op update karma work?
    #original_poster_update_karma

  end

  def set_trending_value!
  @post.trending_value = tv*@post.accuracy_percent +
      10*pv + @post.time_effective/600
  end

  def post_update_karma #this function updates the "value" received from a post

    post_accuracy_ratio = 1

    if @post.inaccuracy == 0 and @post.accuracy == 0
      post_accuracy_ratio = 1
    else
      post_accuracy_ratio = @post.accuracy/(@post.accuracy+@post.inaccuracy)
    end

    #TODO: make sure our karma function doesn't crap out
    @post.karma = 100*log((@post.pageviews/10)*@post.accuracy*10 + 1) *
      (post_accuracy_ratio - 0.4  ) +
      (@post.accuracy/ 10)+
      (sqrt(@post.accuracy + @post.inaccuracy+400)) -
      @post.inaccuracy/10 + 5

    @post.accuracy_percent = post_accuracy_ratio * 100
    
  end

  def original_poster_update_karma #use this to work with the OP's karma
    @post.user.karma = 0

    @post.user.posts.each do |p| #TODO: double check this
      @post.user.karma += p.karma
    end

  end
  
  end