require 'rails_helper'

RSpec.describe TextPost, type: :model do
  before(:all) do
    @user = User.first
  end

  subject {
          @user.text_posts.build(post_body: "Lorem ipsum")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without post_body" do
    subject.post_body = nil
    expect(subject).not_to be_valid
  end

  it "is not valid with blank post_body" do
    subject.post_body = ""
    expect(subject).not_to be_valid
  end

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should belong_to(:user) }
end