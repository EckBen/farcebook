require 'rails_helper'

RSpec.describe 'devise/sessions/new', type: :feature do
  before(:each) do
    visit '/users/sign_in'
  end
  
  it "successfully logs in with valid credentials" do
    within('.form-inputs') do
      fill_in 'Email', with: 'test2@example.com'
      fill_in 'Password', with: 'password123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "fails log in with unregistered email" do
    within('.form-inputs') do
      fill_in 'Email', with: 'fakeemail@example.com'
      fill_in 'Password', with: 'password123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid'
  end

  it "fails log in with wrong password" do
    within('.form-inputs') do
      fill_in 'Email', with: 'test1@example.com'
      fill_in 'Password', with: 'password23'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid'
  end
end