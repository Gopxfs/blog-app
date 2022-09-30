class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    post = Post.find(params[:post_id])

    respond_to do |format|
      format.html { render json: post.comments }
      format.json { render json: post.comments }
    end
  end

  def create
    comment = Comment.create(
      text: params[:text],
      author: current_user,
      post: Post.find(params[:post_id])
    )

    render json: comment
  end
end
