class ChildCommentsController < ApplicationController
  def new
    @comment = Comment.find(params[:id])
    
  end
  def create
    @comment = Comment.find(params[:comment_id])
    
    if params[:child_comment]["body"] != ""
      params[:child_comment]["author"] = current_user.username
      @childComment = @comment.childComment.create(params[:child_comment])
    end
  end
end