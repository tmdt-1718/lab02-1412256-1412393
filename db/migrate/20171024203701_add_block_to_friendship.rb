class AddBlockToFriendship < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :block, :boolean
  end
end
