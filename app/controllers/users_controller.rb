class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @current_user = current_user

    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
  end
end
