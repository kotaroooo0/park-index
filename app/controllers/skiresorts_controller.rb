class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.search(params[:search])
  end

  def show
    @skiresort = Skiresort.find(params[:id])
  end

end
