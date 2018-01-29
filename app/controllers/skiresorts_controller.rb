class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.all
  end

  def show
    @skiresort = Skiresort.find(params[:id])
  end

  def new
  end

  def edit
  end

  def upadate
  end


end
