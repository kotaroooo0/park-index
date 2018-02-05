class ParksController < ApplicationController

  def index
    @skiresort_have_parks = Skiresort.where(area_id: params[:area_id]).have_parks.includes(:parks)
    @area = Area.find(params[:area_id])
  end

  def show
    @park = Park.find(params[:id])
    @comments = @park.comments.order("id DESC").limit(6).includes(:user)
  end

end
