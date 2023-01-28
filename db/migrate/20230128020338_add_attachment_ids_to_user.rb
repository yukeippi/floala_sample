class AddAttachmentIdsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :attachment_ids, :json
  end
end
