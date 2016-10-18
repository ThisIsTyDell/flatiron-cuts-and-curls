class UsersController < ApplicationController
  def index
    @users = User.where("id > 1")
  end

  def show
    @user = User.find(params[:id])
  end
end
