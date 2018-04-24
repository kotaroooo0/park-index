module OmniauthMacros

  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
    # OmniAuth.config.add_mock(:facebook, {uid: '12345'})
  end

  def set_invalid_facebook_omniauth
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  end


end
