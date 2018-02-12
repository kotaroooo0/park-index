class ParksController < ApplicationController

  def index
    @skiresort_have_parks = Area.find(params[:area_id]).skiresorts.have_parks.includes(:parks)
    @area = Area.find(params[:area_id])
  end

  def show
    @park = Park.find(params[:id])
    @comments = @park.comments.order("id DESC").limit(6).includes(:user)
    @lanes = @park.lanes
    @likes = Like.where(comment_id: params[:comment_id])
  end

end
