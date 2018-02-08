class LanesController < ApplicationController

  def create
    @lane = Park.find(params[:park_id]).lanes.build(lane_params)
    if @lane.save
      flash[:success] = "レーンを反映しました。"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "レーンの反映に失敗しました。"
      redirect_to @lane.park
    end
  end

  def update
    @lane = Lane.find(params[:lane_id])
    if @lane.update_attributes(lane_params)
      flash[:success] = 'レーンを反映しました'
      redirect_to @lane.park
    else
      flash[:danger] = "レーンの反映に失敗しました。"
      redirect_to @lane.park
    end
  end

  def destroy
    Lane.find(params[:id]).destroy
    flash[:success] = "レーンを削除しました。"
    redirect_to request.referrer || root_url
  end

  private

  def lane_params
    params.require(:lane).permit(:name, :items)
  end

end
