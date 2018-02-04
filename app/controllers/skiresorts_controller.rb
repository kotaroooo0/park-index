class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.where(area: params[:area]).includes(:parks)
  end

  def search
    @skiresorts = Skiresort.search(params[:search]).includes(:parks)
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
