class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.belongs_to :owner, class_name: User
      t.string :invite_code
      t.timestamps
    end
  end
end
