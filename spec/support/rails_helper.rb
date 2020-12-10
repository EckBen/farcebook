OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => "facebook",
    :uid => "123456789",
    :info => {
      :name => "Tony Stark",
      :email => "tony@stark.com"
    },
    :credentials => {
      :token => "token",
      :refresh_token => "refresh token"
    }
  }
)