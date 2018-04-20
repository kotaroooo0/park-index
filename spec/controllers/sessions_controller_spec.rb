require "rails_helper"

describe SessionsController do
  render_views

  describe "POST #callback" do

    before do
      skip
      set_facebook_omniauth
    end


    it "レスポンスが200であること" do
      post :callback
      expect(response.status).to eq 200
    end

    it "@userに対応したユーザーを割り当てる" do
    end

    it "showテンプレートがrenderされる" do
    end

  end

  describe "GET #destroy" do

    before do
      set_facebook_omniauth
      @user = create(:user)
      set_user_session @user
    end

    it "レスポンスが200であること" do
      delete :destroy
      expect(response.status).to eq 302
    end

    it "セッションが削除される" do
      delete :destroy
      expect(session[:user_id]).to eq nil
    end

    it "rootにリダイレクトされる" do
      skip
      delete :destroy
      expect(response).to render_template root_path
    end

  end

end
