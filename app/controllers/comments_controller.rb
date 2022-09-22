class CommentsController < ApplicationController
  def create
    author = current_user
    post = Post.find(params[:post_id])
    comment = Comment.new(params.require(:comment).permit(:author, :post, :text))
    comment.author = author
    comment.post = post

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully!'
          redirect_to user_post_url(author, post)
        else
          flash.now[:error] = 'Error: Comment could not be created.'
        end
      end
    end
  end
end
