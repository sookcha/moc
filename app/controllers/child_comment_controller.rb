class ChildCommentController < ApplicationController
  def new
    @comment = Comment.find(params[:id])
    if @comment == nil
      @comment = ChildComment.find(params[:id])
    end
  end
  def create
    @comment = Comment.find(params[:comment_id])
    if @comment = nil
      @comment = ChildComment.find(params[:id])
    end
    
    if params[:child_comment]["body"] != ""
      params[:child_comment]["author"] = current_user.username
      @childComment = @comment.childComment.create(params[:child_comment])
    end
  end
end
