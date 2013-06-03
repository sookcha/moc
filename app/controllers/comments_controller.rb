class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.create(params[:comment])
    redirect_to link_path(@link)
  end
end
