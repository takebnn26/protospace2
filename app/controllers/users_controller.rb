class UsersController < ApplicationController
  before_action :set_user
  before_action -> {comfirm_user(@user)}, only: [:edit, :update]
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "You succeeded to edit your profile"
    else
      render edit_user_path(@user), alert: "You can't edit"
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :works, :profile, :group, :image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
