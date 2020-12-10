class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :profile_pic_url
      t.string :city
      t.string :state
      t.string :job
      t.string :workplace

      t.timestamps
    end
  end
end
