class CommentsController < ApplicationController
  # def create
  #   @comment = current_user.comments.new(comment_params)
  #   @comment.save
  #   redirect_to controller: :prototypes, action: :show
  # end
  # private
  # def comment_params
  #   params.require(:comment).permit(
  #     :text,
  #     ).merge(
  #     prototype_id: params[:prototype_id],
  #     user_id: current_user.id
  #     )
  # end
end
