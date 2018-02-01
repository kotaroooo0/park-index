Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook[:client_key], Settings.facebook[:client_secret]
  # provider :twitter, Settings.twitter[:client_key], Settings.twitter[:client_secret]
end
