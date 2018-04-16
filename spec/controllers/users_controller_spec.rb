require "rails_helper"

describe UsersController do

  render_views

  describe "GET #show" do

    before do
      create(:area)
      create(:skiresort)
      3.times { create(:user) }
      @user = create(:user)
      @park = create(:park)
      @comments = []
      3.times { create(:comment, user_id: 1, park_id: @park.id) }
      3.times { @comments.push(create(:comment, user_id: @user.id, park_id: @park.id)) }
      get :show, params: { id: @user.id }
    end


    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@userに対応したユーザーを割り当てる" do
      expect(assigns(:user)).to eq @user
    end

    it "@commentsに対応したコメントを割り当てる" do
      expect(assigns(:comments)).to match_array @comments
    end

    it "showテンプレートがrenderされる" do
      expect(response).to render_template :show
    end

  end

  describe "GET #edit" do

    before do
      create(:area)
      3.times { create(:user) }
      @user = create(:user)
      get :edit, params: { id: @user.id }
    end

    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@userに対応したユーザーを割り当てる" do
      expect(assigns(:user)).to eq @user
    end

    it "editテンプレートがrenderされる" do
      expect(response).to render_template :edit
    end

  end

  describe "PATCH #update" do

    before do
      create(:area)
      3.times { create(:user) }
      @user = create(:user)
      patch :update, params: { id: @user.id, user: { image: "", name: "new_name", area_id: 1, home_gelaende: "home", gender: "male", age: 22, self_introduction: "" } }
    end

    it "レスポンスが302であること" do
      expect(response.status).to eq 302
    end

    it "データベースのユーザーが更新されること" do
    end

    it "users#showにリダイレクトされること" do
      expect(response).to redirect_to user_path(assigns(:user))
    end

  end


end
