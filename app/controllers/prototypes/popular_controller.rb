class Prototypes::PopularController < PrototypesController

  def index
    @prototypes = Prototype.includes(:user).popular
  end

end
