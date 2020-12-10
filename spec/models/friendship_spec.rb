require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    @user = User.last
  end

  subject {
          @user.friendships.build(friend_id: 1,
                            pending: false)
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without friend_id" do
    subject.friend_id = nil
    expect(subject).not_to be_valid
  end
  
  it "is valid without pending" do
    subject.pending = nil
    expect(subject).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:friend).class_name("User") }
end