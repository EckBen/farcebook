require 'rails_helper'

RSpec.describe "sign in through facebook", type: :feature do
  before(:each) do
          Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
          Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "successfully signs in" do
    stub_omniauth
    visit new_user_registration_path
    page.should have_content('Sign in with Facebook')
    click_link "Sign in with Facebook"
    expect(page).to have_content("Successfully")
  end
end