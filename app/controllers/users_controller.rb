class UsersController < ApplicationController
    before_action :authorize, only: [:show]
    def index
        users = User.all
        render json: users
    end

    # def show
    #     user = User.find_by(id: params[:id])
    #     render json: user.cards
    # end

    def show
        render json: @current_user
    end


private

def authorize
    puts "session user id is : #{session[:user_id]}"
    @current_user = User.find_by(id: session[:user_id])
    # render json: {error: "Not authorized"}, status: :unauthorized unless @current_user
end

end
