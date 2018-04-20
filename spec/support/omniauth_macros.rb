module OmniauthMacros

  def set_facebook_omniauth
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        :provider => 'facebook',
        :uid => '123545',
        'info' => {
          :name => 'mockuser'
        }
      }
    )
    OmniAuth.config.add_mock(:facebook, {uid: '12345'})
  end

  def set_invalid_facebook_omniauth
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  end


end
