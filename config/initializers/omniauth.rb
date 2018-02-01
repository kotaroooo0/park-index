Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook[:client_key], Settings.facebook[:client_secret]
end
