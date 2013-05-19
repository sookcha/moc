class UsersController < ApplicationController
  def show
    @userName = params[:userName]
    @user = User.find_by_username(@userName)
    @links = @user.link
  end
  
  def follow
    user = User.find_by_username(params[:userName])
    
    Relationship.create!(:following_id => user.id, :follower_id => current_user.id)
    redirect_to "/" + params[:userName]
  end
  
  def unfollow
    user = User.find_by_username(params[:userName])
    
    Relationship.find_by_following_id(user.id).destroy
    redirect_to "/" + params[:userName]
  end
end