class PostsController < ApplicationController
  before_filter :authenticate_user!, :alert => 'You must be logged in to continue'
	load_and_authorize_resource

	# GET /posts
  # GET /posts.xml
  def index
    @posts = Post.order("name").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

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
    
    @post.tag_list << 'politics' if @post.politics
    @post.tag_list << 'tech' if @post.tech
    @post.tag_list << 'entertainment' if @post.entertainment
    @post.tag_list << 'sports' if @post.sports
    @post.tag_list << 'science' if @post.science
    @post.tag_list << 'crime' if @post.crime
    @post.tag_list << 'business' if @post.business
    @post.tag_list << 'social' if @post.social
    @post.tag_list << 'nature' if @post.nature
    @post.tag_list << 'other' if @post.other
    
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

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
	
end