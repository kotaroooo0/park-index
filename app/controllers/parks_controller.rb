class ParksController < ApplicationController

  def index
    @skiresort_have_parks = Skiresort.where(area: params[:area]).have_parks.includes(:parks)
    @area = Skiresort.getArea(params[:area])
  end

  def show
    @park = Park.find(params[:id])
    @comments = @park.comments.order("id DESC").limit(6).includes(:user)
  end

end
