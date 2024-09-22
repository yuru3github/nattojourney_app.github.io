class ReviewsController < ApplicationController
    before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

    def ensure_correct_user
        @review=Review.find_by(id: params[:id])
        if @review.user_id != @current_user.id
            flash[:notice]="権限がありません"
            redirect_to("/index")
        end
    end

    def index
        @reviews=Review.all.order(created_at: :desc)
    end

    def show
        @review=Review.find_by(id: params[:id])
        @user=@review.user
    end

    def new
        @review=Review.new
    end

    def create
        @review=Review.new(name: params[:name], content: params[:content], user_id: @current_user.id)
        if @review.save
            flash[:notice]="登録成功！"
            redirect_to("/index")
        else
            render("reviews/new")
        end
    end
    
    def edit
        @review=Review.find_by(id: params[:id])
    end

    def update
        @review=Review.find_by(id: params[:id])
        @review.name=params[:name]
        @review.content=params[:content]
        if @review.save
            flash[:notice]="編集成功！"
            redirect_to("/index")
        else
            render("reviews/edit")
        end
    end

    def destroy
        @review=Review.find_by(id: params[:id])
        @review.destroy
        flash[:notice]="削除成功！"
        redirect_to("/index")
    end
end