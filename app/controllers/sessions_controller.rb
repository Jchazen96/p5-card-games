class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: @user
        else
            render json: {error: 'Incorrect Username or Password'}, status: 422
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
