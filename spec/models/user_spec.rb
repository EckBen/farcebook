require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
          described_class.new(email: 'rspec@example.com', 
                              password: 'password123',
                              password_confirmation: 'password123',
                              first_name: 'Harry',
                              last_name: 'Potter',
                              username: 'theChoosenOne')
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without first_name" do
    subject.first_name = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without last_name" do
    subject.last_name = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without username" do
    subject.username = nil
    expect(subject).not_to be_valid
  end

  it { should have_many(:text_posts).dependent(:destroy) }
  it { should have_many(:picture_posts).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:friendships).dependent(:destroy) }
  it { should have_many(:friends).through(:friendships) }
  it { should have_many(:rec_friendships).class_name("Friendship").with_foreign_key(:friend_id) }
  it { should have_many(:rec_friends).through(:rec_friendships).source(:user) }
end