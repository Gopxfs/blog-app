class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    respond_to do |format|
      format.html { render json: @posts }
      format.json { render json: @posts }
    end
  end
end
