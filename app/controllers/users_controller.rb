class UsersController < ApplicationController
    before_action :get_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            redirect_to user
        else
        end
    end

    def show
    end

    private
    def user_params
        params.require(:user).permit(:username, :display_name)
    end

    def get_user
        @user = User.find(params[:id])
    end
end