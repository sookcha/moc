class MainController < ApplicationController
  def index
    if user_signed_in?
      @followingUsers = current_user.following.all
      @allActivities = []
      
  		@followingUsers.each do |user|
        @allActivities << user.links.all
      end
    end
  end
end