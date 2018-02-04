class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.where(area: params[:area]).includes(:parks)
    @area = getArea(params[:area])
  end

  def search
    @skiresorts = searchSkiresorts(params[:search]).includes(:parks)
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
