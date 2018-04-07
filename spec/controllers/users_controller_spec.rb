require "rails_helper"

describe UsersController do

  render_views

  describe "GET #show" do

    before do
    end


    it "レスポンスが200であること" do
      # expect(response.status).to eq 200
    end

    it "@userに対応したユーザーを割り当てる" do
    end

    it "showテンプレートがrenderされる" do
      # expect(response).to render_template :show
    end

  end

  describe "GET #edit" do

    before do
    end

    it "レスポンスが200であること" do
      # expect(response.status).to eq 200
    end

    it "@userに対応したユーザーを割り当てる" do
    end

    it "editテンプレートがrenderされる" do
      # expect(response).to render_template :edit
    end

  end

  describe "PATCH #update" do

    before do
    end

    it "レスポンスが302であること" do
      # expect(response.status).to eq 200
    end

    it "データベースのユーザーが更新されること" do
    end

    it "users#showにリダイレクトされること" do
      # expect(response).to redirect_to user_path(assigns(:user))
    end

  end


end
