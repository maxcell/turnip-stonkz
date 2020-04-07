class UserHasManyBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_boards do |t|
      t.belongs_to :user
      t.belongs_to :board
    end
  end
end
