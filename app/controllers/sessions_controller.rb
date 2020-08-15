class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:error] = "Invalid Entry"
            redirect_to login_path
        end 
    end

end