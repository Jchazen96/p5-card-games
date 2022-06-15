class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user.cards
    end

    def check_login
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

end
