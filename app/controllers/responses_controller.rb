class ResponsesController < ApplicationController
    before_action :set_essay, only:[:show, :edit, :update, :destroy]

    def new 
        if set_essay 
            @responses = @essay.responses.build
        else 
            @response = Response.new 
        end 
    end

    def create 
        @response = current_user.responses.build(response_params)
        if @response.save 
            redirect_To response_path(@response)
        else 
            render :new 
        end 
    end 

    def index 
        if set_essay 
            @responses = @essay.responses 
        else 
            @responses = Response.all
        end 
    end 


    private

    def set_essay 
        @essay = Essay.find_by_id(params[:essay_id])
    end

    def response_params
        params.require(:repsonse).permit(:content, :essay_id)
    end  

end