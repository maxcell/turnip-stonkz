class AddUniquenessToInviteCode < ActiveRecord::Migration[6.0]
  def change
    add_index :boards, :invite_code, unique: true
  end
end
