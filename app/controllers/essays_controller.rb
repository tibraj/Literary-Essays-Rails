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
        if !set_essay  
            redirect_to essays_path
        end
    end 

    def index
        @essays = Essay.all
    end

    def recent 
        @essays = Essay.all.recent
    end

    def edit 
        if current_user.id == @essay.user_id 
        else 
            redirect_to essays_path
        end 
    end

    def update 
        if @essay.update(essay_params)
            redirect_to essay_path(@essay)
        else 
            render :edit 
        end
    end 

    def destroy 
        set_essay 
        if @essay.present?
            @essay.destroy
            redirect_to user_path(@essay.user)
        end
    end

    private 

    def essay_params 
        params.require(:essay).permit(:title, :content, :book_id, book_attributes: [:title, :author])
    end

    def set_essay
        @essay = Essay.find_by_id(params[:id])
    end

end