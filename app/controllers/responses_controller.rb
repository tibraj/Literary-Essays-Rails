class ResponsesController < ApplicationController

    def new 
    end

    private

    def set_essay 
        @essay = Essay.find_by_id(params[:essay_id])
    end

    

end