class LanesController < ApplicationController

  before_action :logged_in_user?

  def create
    @lane = Park.find(params[:park_id]).lanes.build(lane_params)
    if @lane.save
      flash[:info] = "レーンを反映しました。"
      redirect_to request.referrer || root_url
    else
      flash[:info] = "レーンの反映に失敗しました。"
      redirect_to @lane.park
    end
  end

  def update
    @lane = Lane.find(params[:lane_id])
    if @lane.update_attributes(lane_params)
      flash[:info] = 'レーンを反映しました'
      redirect_to @lane.park
    else
      flash[:info] = "レーンの反映に失敗しました。"
      redirect_to @lane.park
    end
  end

  def destroy
    Lane.find(params[:id]).destroy
    flash[:info] = "レーンを削除しました。"
    redirect_to request.referrer || root_url
  end

  private

  def lane_params
    params.require(:lane).permit(:name, :items, :user_id)
  end

end
