class SkiresortsController < ApplicationController

  def index
    if params[:search]
      # ヘッダーの検索から利用される時
      @skiresorts = Skiresort.search(params[:search]).includes(:parks)
    else
      # エリアごとに利用される時
      @skiresorts = Skiresort.where(area: params[:area]).includes(:parks)
    end
  end

  def show
    @skiresort = Skiresort.find(params[:id])
    @parks = @skiresort.parks
  end

end
