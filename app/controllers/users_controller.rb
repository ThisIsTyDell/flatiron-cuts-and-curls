class UsersController < ApplicationController
  def index
    @users = User.where("id > 1")
  end
end
