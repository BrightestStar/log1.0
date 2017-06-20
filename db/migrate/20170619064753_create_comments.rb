class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :log_id
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :comments, :log_id
  end
end
