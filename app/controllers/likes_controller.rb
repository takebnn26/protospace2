class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, pratotype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototyoe = Prototype.all
  end
  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy = Like.where(prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:id])
    @prototype = Prototype.all
  end
end
