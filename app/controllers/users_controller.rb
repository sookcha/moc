class UsersController < ApplicationController
  def show
    @username = params[:username]
    @user = User.find_by_username(params[:username])
    @links = @user.link
  end
end