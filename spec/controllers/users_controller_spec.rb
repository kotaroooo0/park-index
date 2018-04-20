require "rails_helper"

describe UsersController do

  render_views

  describe "GET #show" do

    before do
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
      3.times { create(:user) }
      @user = create(:user, name: "name", home_gelaende: "gelaende")
    end

    it "レスポンスが302であること" do
      patch :update, params: { id: @user.id, user: attributes_for(:user)}
      expect(response.status).to eq 302
    end

    context "有効な属性の場合" do

      it "要求された@userを取得すること" do
        patch :update, params: { id: @user.id, user: attributes_for(:user) }
        expect(assigns(:user)).to eq(@user)
      end

      it "@userの属性を変更すること" do
        patch :update, params: { id: @user.id, user: attributes_for(:user, name: "new_name", home_gelaende: "new_gelaende") }
        @user.reload
        expect(@user.name).to eq('new_name')
        expect(@user.home_gelaende).to eq('new_gelaende')
      end

      it "users#showにリダイレクトされること" do
        patch :update, params: { id: @user.id, user: attributes_for(:user) }
        expect(response).to redirect_to user_path(assigns(:user))
      end

    end

    context "無効な属性の場合" do

      it "@userの属性を変更しないこと" do
        patch :update, params: { id: @user.id, user: attributes_for(:user, name: nil, home_gelaende: "new_gelaende") }
        @user.reload
        expect(@user.name).to eq('name')
        expect(@user.home_gelaende).not_to eq('new_gelaende')
      end

      it "editテンプレートがrenderされる" do
        patch :update, params: { id: @user.id, user: attributes_for(:user, name: nil, home_gelaende: "new_gelaende") }
        expect(response).to render_template :edit
      end

    end
  end
end
