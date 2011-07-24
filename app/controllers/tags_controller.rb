class TagController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.create(params[:tag])
  end
end
