require "rails_helper"

describe "UserFeature" do

  describe "facebook連携でサインアップする" do

    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit root_path
      click_link "ログイン"
    end

    it "サインアップするとユーザーが増える" do
      expect{
        click_link "Facebookでログイン"
      }.to change(User, :count).by(1)
    end

    it "ログアウト" do
    
    end

    it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      click_link "Facebookでログイン"
      click_link "ログアウト"
      click_link "ログイン"
      expect{
        click_link "Facebookでログイン"
      }.not_to change(User, :count)
    end

    it "サインアップするとホームへリダイレクトされる" do
      click_link "Facebookでログイン"
      expect(current_path).to eq root_path
    end
  end
end
