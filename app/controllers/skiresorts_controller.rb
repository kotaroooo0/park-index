class SkiresortsController < ApplicationController

  def index
    @skiresorts = Area.find(params[:area_id]).skiresorts.page(params[:page]).per(9).includes(:parks)
    @area = Area.find(params[:area_id])
  end

  def search
    @skiresorts = searchSkiresorts(params[:search]).page(params[:page]).per(9).includes(:parks)
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
