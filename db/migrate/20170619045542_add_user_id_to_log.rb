class AddUserIdToLog < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :user_id, :integer
    add_index :logs, :user_id
  end
end
