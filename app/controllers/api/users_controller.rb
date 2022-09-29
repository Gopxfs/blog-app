class Api::UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html { render json: @users }
      format.json { render json: @users }
    end
  end
end
