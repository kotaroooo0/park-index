class UsersController < ApplicationController

  before_action :logged_in_user?, only:[:edit, :update]
  before_action :correct_user?, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order("id DESC").includes(:user)
    @likes = Like.where(comment_id: params[:comment_id])
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
