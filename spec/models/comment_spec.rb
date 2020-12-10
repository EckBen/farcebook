require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.last
  end

  subject {
          @user.comments.build(commentable_type: "TextPost",
                              commentable_id: 1,
                              comment_body: "Test comment.")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without comment_body" do
    subject.comment_body = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without commentable_type" do
    subject.commentable_type = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without commentable_id" do
    subject.commentable_id = nil
    expect(subject).not_to be_valid
  end

  it "is not valid with blank comment_body" do
    subject.comment_body = ""
    expect(subject).not_to be_valid
  end

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }
end