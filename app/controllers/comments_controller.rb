class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      redirect_to prototype_path(@comment.prototype)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id).merge(prototype_id: params[:prototype_id])
  end

end
