class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    author = current_user
    like = Like.new(params.permit(:author, :post))
    like.author = author
    like.post = post

    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'You liked this post!'
          redirect_to user_post_url(author, post)
        else
          flash.now[:error] = 'Error: Post could not be liked.'
        end
      end
    end
  end
end
