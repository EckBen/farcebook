class CreateTextPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :text_posts do |t|
      t.text :post_body
      t.integer :user_id

      t.timestamps
    end
  end
end
