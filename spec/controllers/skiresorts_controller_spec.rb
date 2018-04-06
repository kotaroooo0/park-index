require "rails_helper"

describe SkiresortsController do

  render_views

  describe "GET #index" do

    before do
      create(:area)
      @hakuba = create(:skiresort, name: "白馬")
      @myoko = create(:skiresort, name: "妙高")
      get :index, params: {area_id: 1}
    end


    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@skiresortsに対応エリアのスキー場を割り当てる" do
      expect(assigns(:skiresorts)).to match_array([@hakuba,@myoko])
    end

    it "indexテンプレートがrenderされる" do
      expect(response).to render_template :index
    end

  end

  describe "GET #search" do

    before do
      create(:area)
      @hakuba = create(:skiresort, name: "白馬")
      @myoko = create(:skiresort, name: "妙高")
      get :search, params: {search: "白馬"}
    end

    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@skiresortsに検索したスキー場を割り当てる" do
      expect(assigns(:skiresorts)).to match_array([@hakuba])
    end

    it "searchテンプレートがrenderされる" do
      expect(response).to render_template :search
    end

  end


end
