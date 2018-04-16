module OmniAuthTestHelper

  def facebook_login_setup
    OmniAuth.config.test_mode = true
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

  def facebook_login_failure
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  end


end
