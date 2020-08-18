class ResponsesController < ApplicationController

    def new 
    end

    private

    def set_essay 
        @essay = Essay.find_by_id(params[:essay_id])
    end

    def response_params
        params.require(:repsonse).permit(:content, :essay_id)
    end  

end