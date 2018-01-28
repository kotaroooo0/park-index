class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.all
  end

end
