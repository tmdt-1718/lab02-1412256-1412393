class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.integer :mess_id
      t.integer :user_id

      t.timestamps
    end
  end
end
