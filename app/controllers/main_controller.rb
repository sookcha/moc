class MainController < ApplicationController
  def index
    if user_signed_in?
      @followingUsers = current_user.following
      @allActivities = []
      @feeds = Link.from_users_followed_by(current_user).reverse
      @feeds_page = Kaminari.paginate_array(@feeds).page(params[:page]).per(20)
        
  		@followingUsers.each do |user|       
        @allActivities << user.links.all
      end
    end
  end
end