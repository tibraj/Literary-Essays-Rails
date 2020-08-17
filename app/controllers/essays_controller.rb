class EssaysController < ApplicationController 

    def new 
        @essay = Essay.new 
        @essay.build_book 
    end 

    private 

    def essay_params 
        params.require(:essay).permit(:title, :content, :book_id, book_attributes: [:title, :author])
    end

end