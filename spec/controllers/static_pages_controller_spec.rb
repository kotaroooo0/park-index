require "rails_helper"

describe StaticPagesController do

  describe "GET #home" do

    before do
      get :home
    end

    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "ホームページがrenderされる" do
      expect(response).to render_template :home
    end

  end

  describe "GET #login" do

    before do
      get :login
    end

    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "ログインページがrenderされる" do
      expect(response).to render_template :login
    end

  end

end
