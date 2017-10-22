class CreateAddingfriends < ActiveRecord::Migration[5.1]
  def change
    create_table :addingfriends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :friend_name
      t.string :friend_email

      t.timestamps
    end
  end
end
