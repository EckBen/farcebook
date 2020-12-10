require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.first
  end

  subject {
          @user.likes.build(likeable_type: "TextPost",
                            likeable_id: 3)
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without likeable_type" do
    subject.likeable_type = nil
    expect(subject).not_to be_valid
  end
  
  it "is not valid without likeable_id" do
    subject.likeable_id = nil
    expect(subject).not_to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:likeable) }
end