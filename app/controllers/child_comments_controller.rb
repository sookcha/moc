class ChildCommentsController < ApplicationController
  def new
    @comment = Comment.find(params[:id])
    if @comment == nil
      @comment = Childcomment.find(params[:id])
    end
    
  end
  def create
    @comment = Comment.find(params[:comment_id])
    if @comment == nil
      @comment = Childcomments.find(params[:id])
    end
    
    if params[:childcomment]["body"] != ""
      params[:childcomment]["author"] = current_user.username
      @childComment = @comment.childcomment.create(params[:childcomment])
    end
    redirect_to "/discuss/" + @comment.link.title
  end
end