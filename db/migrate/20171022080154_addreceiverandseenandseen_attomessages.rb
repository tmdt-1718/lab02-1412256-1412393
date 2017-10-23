class AddreceiverandseenandseenAttomessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :seen, :boolean
    add_column :messages, :seen_at, :datetime
    add_column :messages, :receiver, :integer
  end
end
