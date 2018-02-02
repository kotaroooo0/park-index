class ParksController < ApplicationController

  def index
    @skiresort_have_parks = Skiresort.have_parks
  end

  def show
    @park = Park.find(params[:id])
    @comment = Comment.new
  end

end
