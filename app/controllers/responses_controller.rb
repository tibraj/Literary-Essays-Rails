class ResponsesController < ApplicationController

    def new 
        if set_essay 
            @responses = @essay.responses.build
        else 
            @response = Response.new 
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