class BoardsController < ApplicationController
    before_action :get_board, only: [:show]

    def index
        @joined_boards = current_user.boards
        @owned_board = current_user.board
    end

    def show
        @board = Board.find(params[:id])
    end
    
    def join
        board = Board.find_by(invite_code: params[:invite_code])

        if board.nil? || board.owner == current_user 
            redirect_to "/boards"
        else
            user_board = UserBoard.find_or_create_by(board: board, user: current_user)
            redirect_to board
        end
    end

    private
    def get_board
        @board = Board.find(params[:id])

        redirect_to "/boards" unless viewable?
    end

    def viewable?
        return @board.owner == current_user || @board.users.include?(current_user)
    end
end