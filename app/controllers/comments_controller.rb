class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    if @comment.save
    else
      redirect_to prototype_path(@prototype)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id).merge(prototype_id: params[:prototype_id])
  end

end
