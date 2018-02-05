class SkiresortsController < ApplicationController

  def index
    @skiresorts = Skiresort.where(area: params[:area]).page(params[:page]).per(9).includes(:parks)
    @area = getArea(params[:area])
    agent = Mechanize.new
    page = agent.get("https://snow.gnavi.co.jp/guide/htm/r0023gp.htm".gsub(/s.htm/, "gp.htm"))
    @elems = page.search('span.alphabet')
    # @elems = page.search('body')
  end

  def search
    @skiresorts = searchSkiresorts(params[:search]).includes(:parks)
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
