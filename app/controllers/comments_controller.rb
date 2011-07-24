class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.xml
  def create
    @post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		@comment.name = current_user.name
<<<<<<< HEAD
    #Jon added
    @comment.user = current_user
=======
>>>>>>> 8f777215bdebd86f4816ad82260125b7888dbed2
		
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
<<<<<<< HEAD

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

=======
>>>>>>> 8f777215bdebd86f4816ad82260125b7888dbed2
end