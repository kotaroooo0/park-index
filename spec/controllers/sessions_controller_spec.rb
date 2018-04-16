require "rails_helper"

describe SessionsController do

  # def facebook_login_setup
  #   OmniAuth.config.test_mode = true
  #   OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  #     {
  #       :provider => 'facebook',
  #       :uid => '123545',
  #       'info' => {
  #         :name => 'mockuser'
  #       }
  #     }
  #   )
  # end
  #
  # def facebook_login_failure
  #   OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  # end

  render_views

  describe "GET #callback" do

    before do
      # get :callback
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

  describe "GET #destroy" do

    before do
      # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      # OmniAuth.config.mock_auth[:facebook] = nil
      # Rails.application.env_config['omniauth.auth'] = facebook_login_setup
      # get :callback
      # get :destroy
    end

    it "レスポンスが200であること" do
      # expect(response.status).to eq 200
    end

    it "セッションが削除される" do
    end

    it "rootにリダイレクトされる" do
      # expect(response).to render_template :edit
    end

  end


end
