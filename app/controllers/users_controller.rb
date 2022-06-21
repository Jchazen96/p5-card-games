class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @user = User.new
    end

    def create
        @user = User.create(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user
        render json: @user
        else
        render json: {error: "Username already exists"}
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user.cards
    end

    def index
        users = User.all
        render json: users
    end
end
