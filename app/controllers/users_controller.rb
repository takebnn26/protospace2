class UsersController < ApplicationController
  before_action :set_user
  before_action :comfirm_user, except: :show
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "You succeeded to edit your profile"
    else
      render edit_user_path(@user), alert: @user.errors.full_messages
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
  def comfirm_user
    redirect_to prototypes_index_path unless current_user.id == @user.id
  end
end
