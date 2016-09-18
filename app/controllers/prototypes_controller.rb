class PrototypesController < ApplicationController
  def index
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
      render :new, alert: 'You failed in posting'
    end
  end

  def show
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
end
