class Prototypes::PopularController < PrototypesController

  def index
    @prototypes = Prototype.includes(:user).popular.page(params[:page])
  end

end
