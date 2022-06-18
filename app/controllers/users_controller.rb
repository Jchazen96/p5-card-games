class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize, only: [:show]

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
        @user = User.find(params[:id])
    end

    def index
        users = User.all
        render json: users
    end
end
