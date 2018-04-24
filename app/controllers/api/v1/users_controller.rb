class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render "api/v1/users/index", :handlers => 'jbuilder'
  end

  def show
    @user = User.find(params[:id])
  end

end
