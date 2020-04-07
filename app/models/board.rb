class Board < ApplicationRecord
    belongs_to :owner, class_name: 'User'
    has_many :user_boards
    has_many :users, through: :user_boards

    def participants
        self.users + [self.owner]
    end
end
