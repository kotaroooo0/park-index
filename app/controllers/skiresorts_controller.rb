class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.where(area_id: params[:area_id]).page(params[:page]).per(9).includes(:parks)
    @area = Constants::Area.find(params[:area_id])
  end

  def search
    @skiresorts = searchSkiresorts(params[:search]).page(params[:page]).per(9).includes(:parks)
  end

end
