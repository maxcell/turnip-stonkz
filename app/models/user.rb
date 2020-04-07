class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    has_one :board, foreign_key: :owner_id, dependent: :destroy
    has_many :user_boards, dependent: :destroy
    has_many :boards, through: :user_boards
    has_many :buying_prices, dependent: :destroy
    has_many :selling_prices, dependent: :destroy

    after_create :create_board

    def invite_code
        self.board.invite_code
    end

    def all_boards
        self.board + self.boards
    end

    def latest_buying_price
       self.buying_prices.order(time_submitted: :desc).first
    end

    def latest_selling_price
        self.selling_prices.order(time_submitted: :desc).first
    end

    def email_required?
        false
    end

    def will_save_change_to_email?
        false
    end


    private
    def create_board
        invite_code = SecureRandom.uuid
        board = Board.create(owner_id: self.id, invite_code: invite_code)
    end
end
