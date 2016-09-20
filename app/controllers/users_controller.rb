class UsersController < ApplicationController
  def edit
     redirect_to prototypes_index_path unless current_user.id == params[:id].to_i
     @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to edit_user_path, success: "You succeeded to edit your profile"
    else
      render prototypes_index_path, warning: "You failed to edit your profile"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :works, :profile, :group, :image)
  end
end
