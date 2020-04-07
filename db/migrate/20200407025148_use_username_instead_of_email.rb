class UseUsernameInsteadOfEmail < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :email
    change_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end
end
