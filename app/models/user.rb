class User < ApplicationRecord
    has_one :board, foreign_key: :owner_id
    has_many :user_boards
    has_many :boards, through: :user_boards

    after_create :create_board

    def invite_code
        self.board.invite_code
    end

    def all_boards
        self.board + self.boards
    end

    private
    def create_board
        invite_code = SecureRandom.uuid
        board = Board.create(owner_id: self.id, invite_code: invite_code)
    end
end
