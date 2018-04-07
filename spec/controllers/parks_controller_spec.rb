require "rails_helper"

describe ParksController do

  render_views

  describe "GET #index" do

    before do
      create(:area)
      @hakuba = create(:skiresort, name: "白馬")
      @myoko = create(:skiresort, name: "妙高")
      @hakuba.parks.build(name: "47parks", area_id: 1, description: "description", picture: "http://keijiokamoto.com/system/wp-content/uploads/2016/11/hakuba47park2013-5.jpg").save
      get :index, params: {area_id: 1}
    end


    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@skiresort_have_parksに対応エリアのスキー場を割り当てる" do
      expect(assigns(:skiresort_have_parks)).to match_array([@hakuba])
    end

    it "indexテンプレートがrenderされる" do
      expect(response).to render_template :index
    end

  end

  describe "GET #show" do

    before do
      create(:area)
      @hakuba = create(:skiresort, name: "白馬")
      @myoko = create(:skiresort, name: "妙高")
      @hakuba_park = @hakuba.parks.build(id: 1, name: "hakuba_park", area_id: 1, description: "description", picture: "http://keijiokamoto.com/system/wp-content/uploads/2016/11/hakuba47park2013-5.jpg")
      @hakuba_park.save
      get :show, params: {id: 1}
    end

    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@parkに要求したパークを割り当てる" do
      expect(assigns(:park)).to eq @hakuba_park
    end

    it "searchテンプレートがrenderされる" do
      expect(response).to render_template :show
    end

  end


end
