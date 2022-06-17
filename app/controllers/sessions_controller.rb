class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        puts "session user id is : #{session[:user_id]}"
        render json: user
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
