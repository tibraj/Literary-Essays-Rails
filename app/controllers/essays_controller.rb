class EssaysController < ApplicationController 
    before_action :set_essay, only:[:show, :edit, :update]
    before_action :if_not_logged_in

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

    def show
    end 

    def index
        @essays = Essay.all
    end

    def edit 
        if current_user.id == @essay.user_id 
        else 
            redirect_to essays_path
        end 
    end

    def update 
        if @essay.update 
            redirect_to essay_path(@essay)
        else 
            render :edit 
        end
    end 

    def destroy 
        @essay.destroy
        redirect_to user_path(@essay.user)
    end

    private 

    def essay_params 
        params.require(:essay).permit(:title, :content, :book_id, book_attributes: [:title, :author])
    end

    def set_essay
        @essay = Essay.find(params[:id])
        redirect_to essays_path if !@essay
    end

end