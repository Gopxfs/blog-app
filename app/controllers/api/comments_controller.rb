class Api::CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])

    respond_to do |format|
      format.html { render :json => post.comments }
      format.json  { render :json => post.comments }
    end
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.author = current_user
    comment.post = Post.find(params[:post_id])

    render json: comment, status: :created if comment.save
  end
end