require 'rails_helper'

RSpec.describe Profile, type: :model do
  before(:all) do
    @user = User.last
  end
  
  subject {
          @user.build_profile(profile_pic_url: "https://images.pexels.com/photos/3182747/pexels-photo-3182747.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                              city: "Scranton",
                              state: "PA",
                              job: "Business",
                              workplace: "Business office")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is valid with only profile_pic_url, workplace, and user_id" do
    subject.city = nil
    subject.state = nil
    subject.job = nil
    expect(subject).to be_valid
  end

  it "is valid with only user_id" do
    subject.city = nil
    subject.state = nil
    subject.job = nil
    subject.workplace = nil
    subject.profile_pic_url = nil
    expect(subject).to be_valid
  end

  it { should belong_to(:user) }
end