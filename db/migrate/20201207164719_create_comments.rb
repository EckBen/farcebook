class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
