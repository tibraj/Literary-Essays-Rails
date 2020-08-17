class EssaysController < ApplicationController 

    def new 
        @essay = Essay.new 
        @essay.build_book 
    end 

    def create
        @essay = Essay.new(essay_params)
        @essay.user_id = session[:user_id]
        if @essay.save
            redirect_to essay_path(@essay)
        else 
            @essay.build_book 
            render :new 
        end 
    end

    private 

    def essay_params 
        params.require(:essay).permit(:title, :content, :book_id, book_attributes: [:title, :author])
    end

end