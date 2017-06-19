class AddIsHiddenToLog < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :is_hidden, :boolean, default: false
  end
end
