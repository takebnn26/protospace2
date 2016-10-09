class PrototypesController < ApplicationController

  before_action :prototype_set, only: [:edit, :update, :show, :destroy]
  before_action -> {comfirm_user(@prototype)}, only: [:edit, :update, :destroy]
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
      flash[:alert] = "You can't post it"
      render action: :new
    end
  end
  def show
    @like = Like.find_by(user_id: current_user.id, prototype_id: @prototype.id)
  end
  def edit
  end
  def update
    if @prototype.update(proto_params)
      redirect_to root_path, notice: 'You suceeded in updating'
    else
      flash[:alert] = "You can't edit it"
      render action: :edit
    end
  end
  def destroy
    if @prototype.destroy
      redirect_to root_path, notice: 'You succeeded in deleting'
    else
      flash[:alert] = "You can't delete it"
      render action: :index
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
