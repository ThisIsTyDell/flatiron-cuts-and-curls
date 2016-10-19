class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where("id > 1")
    authorize User
  end

  def show
    authorize @user
  end

  def edit
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :stylist_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
