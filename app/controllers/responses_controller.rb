class ResponsesController < ApplicationController
    before_action :if_not_logged_in
    before_action :set_essay

    def new 
        @response = Response.new 
    end

    def create
        @response = Response.new(response_params)
        @response.user_id = session[:user_id]
        if @response.save
            redirect_to essay_path(@response)
        else 
            render :new 
        end 
    end

    def index 
        @responses = Response.all
    end 

    def show 
    end 

    def edit 
        if current_user.id == @response.user_id 
        else 
            redirect_to responses_path
        end 
    end

    def update 
        if @response.update 
            redirect_to response_path(@response)
        else 
            render :edit 
        end
    end 

    def destroy 
        @response.destroy
        redirect_to user_path(@response.user)
    end

    private

    def response_params
        params.require(:response).permit(:content)
    end 
    
    def set_essay
        @essay = Essay.find(params[:id])
        redirect_to essays_path if !@essay
    end

end