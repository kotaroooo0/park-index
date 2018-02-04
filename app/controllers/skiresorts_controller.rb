class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.where(area: params[:area]).includes(:parks)
    @area = getArea(params[:area])
    agent = Mechanize.new
    page = agent.get("https://snow.gnavi.co.jp/guide/htm/r0061s.htm")
    @elements = page.search('td em')[2].inner_text
  end

  def search
    @skiresorts = searchSkiresorts(params[:search]).includes(:parks)
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
