class CreatePicturePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :picture_posts do |t|
      t.string :picture_title
      t.text :picture_body
      t.text :picture_url
      t.integer :user_id

      t.timestamps
    end
  end
end
