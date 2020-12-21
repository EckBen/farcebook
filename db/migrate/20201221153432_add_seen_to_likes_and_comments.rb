class AddSeenToLikesAndComments < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :seen, :boolean, default: false
    add_column :comments, :seen, :boolean, default: false
  end
end
