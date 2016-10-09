class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

end
