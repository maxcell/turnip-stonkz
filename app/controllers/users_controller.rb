class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render user_path(user)
    end
end