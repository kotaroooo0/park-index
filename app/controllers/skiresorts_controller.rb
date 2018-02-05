class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.where(area_id: params[:area_id]).page(params[:page]).per(9).includes(:parks)
    @area = Area.find(params[:area_id])
  end

  def search
    @skiresorts = searchSkiresorts(params[:search]).includes(:parks)
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
