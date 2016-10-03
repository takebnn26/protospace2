class UsersController < ApplicationController
  def edit
     @user = User.find(params[:id])
     redirect_to prototypes_index_path unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "You succeeded to edit your profile"
    else
      redirect_to edit_user_path(@user), alert: @user.errors.full_messages
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :works, :profile, :group, :image)
  end
end
