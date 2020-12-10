require 'rails_helper'

RSpec.describe PicturePost, type: :model do
  before(:all) do
    @user = User.first
  end

  subject {
          @user.picture_posts.build(picture_title: "Meetings",
                                    picture_body: "Busy at my fancy business meeting.",
                                    picture_url: "https://images.pexels.com/photos/3182833/pexels-photo-3182833.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without picture_url" do
    subject.picture_url = nil
    expect(subject).not_to be_valid
  end

  it "is valid with only picture_url" do
    subject.picture_title = nil
    subject.picture_body = nil
    expect(subject).to be_valid
  end

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should belong_to(:user) }
end