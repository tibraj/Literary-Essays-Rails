class ResponsesController < ApplicationController
    before_action :if_not_logged_in

    def new
        if @essay = Essay.find_by_id(params[:essay_id]) 
            @response = @essay.responses.build
        else 
            @response = Response.new
        end 
    end

    def create
        @response = current_user.responses.build(response_params)
        if @response.save
            redirect_to response_path(@response)
        else 
            render :new 
        end 
    end

    def index 
        @responses = Response.all
    end 

    def show 
        @response = Response.find_by_id(params[:id])
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
        params.require(:response).permit(:essay_id, :content)
    end 
    
    def set_essay
        @essay = Essay.find_by_id(params[:id])
    end

end