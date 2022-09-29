class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    author = current_user
    post = Post.new(params.require(:post).permit(:comments_counter, :likes_counter, :author, :title, :text))
    post.likes_counter = 0
    post.comments_counter = 0
    post.author = author

    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post created successfully!'
          redirect_to user_url(author)
        else
          flash.now[:error] = 'Error: Post could not be created.'
          render :new, locals: { post: }, status: 422
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_url }
      format.json { head :no_content }
    end
  end
end
