class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:error] = "Invalid Entry"
            redirect_to login_path
        end 
    end

    def omniauth 
        @user = User.create_by_omniauth(auth)
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private 

    def auth 
        request.env['omniauth.auth']
    end

end