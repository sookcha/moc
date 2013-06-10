class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    
    if params[:comment]["body"] != ""
      params[:comment]["author"] = current_user.username
      @comment = @link.comments.create(params[:comment])
    end
    redirect_to "/discuss/" + @link.title
  end
  
  def destroy
    @link = Link.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
    @comment.destroy
    redirect_to "/discuss/" + @link.title
  end
  
end