class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order("id DESC").includes(:user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:info] = '詳細を編集しました'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :area_id, :home_gelaende, :gender, :age, :self_introduction)
  end

end
