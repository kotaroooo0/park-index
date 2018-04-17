require "rails_helper"

describe SessionsController do

  def facebook_login
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        :provider => 'facebook',
        :uid => '123545',
        'info' => {
          :name => 'mockuser'
        }
      }
    )
  end

  render_views

  describe "POST #callback" do

    before do
      OmniAuth.config.test_mode = true
      # request.env['omniauth.auth'] = facebook_login_setup
      # # request.env["devise.mapping"] = Devise.mappings[:facebook]
      # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      # Rails.application.env_config['omniauth.auth'] = facebook_login_setup
      # facebook_login
      # get :callback
      # get '/auth/facebook/callback'
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
