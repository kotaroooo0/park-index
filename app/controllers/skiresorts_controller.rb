class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.search(params[:search])
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
