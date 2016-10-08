class PrototypesController < ApplicationController

  before_action :prototype_set, only: [:edit, :update, :show, :destroy]
  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end
  def new
    @prototype = Prototype.new
    @prototype.images.build
  end
  def create
    @prototype = current_user.prototypes.new(proto_params)
    if @prototype.save
      redirect_to root_path, notice: 'You succeeded in posting'
    else
      redirect_to new_prototype_path, alert: @prototype.errors.full_messages
    end
  end
  def show
    @like = Like.find_by(prototype_id: @prototype.id)
  end
  def edit
  end
  def update
    if @prototype.update(proto_params)
      redirect_to root_path, notice: 'You suceeded in updating'
    else
      redirect_to edit_prototype_path(@prototype), alert: @prototype.errors.full_messages
    end
  end
  def destroy
    if @prototype.destroy
      redirect_to root_path, notice: 'You succeeded in deleting'
    else
      redirect_to root_path, alert: @prototype.errors.full_messages
    end
  end
  private
  def proto_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      images_attributes: [:id, :content,:content_type]
    )
  end

  def prototype_set
    @prototype = Prototype.find(params[:id])
  end
end
