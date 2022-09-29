class Api::CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])

    respond_to do |format|
      format.html { render :json => post.comments }
      format.json  { render :json => post.comments }
    end
  end
end