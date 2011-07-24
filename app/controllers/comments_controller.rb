class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.xml
  def create
    @post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		@comment.name = current_user.name
    #Jon added
    @comment.user = current_user
		
		redirect_to post_path(@post)
	end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
	end

  def vote_up
    @comment.points_up += 1
    if vote_changed?
    end

    update_values

  end

  def vote_down
    @comment.points_up -= 1
    if vote_changed?
    end

    update_values

  end

  def vote_changed?
    
  end

  def update_values

  end

end