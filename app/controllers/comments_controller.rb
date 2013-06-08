class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    params[:comment]["author"] = current_user.username
    @comment = @link.comments.create(params[:comment])
    redirect_to link_path(@link)
  end
end
