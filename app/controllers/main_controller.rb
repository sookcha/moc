class MainController < ApplicationController
  def index
    if user_signed_in?
      @followingUsers = current_user.following
      @allActivities = []
      @feeds = Link.from_users_followed_by(current_user).page params[:page]
        
  		@followingUsers.each do |user|       
        @allActivities << user.links.all
      end
    end
  end
end