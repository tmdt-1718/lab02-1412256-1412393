class RenameMessIdToMessageId < ActiveRecord::Migration[5.1]
  def change
    rename_column :receivers, :mess_id, :message_id
  end
end
