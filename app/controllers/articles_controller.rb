class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: %i[new create edit update destroy]
    before_action :set_article, only: %i[show edit update destroy]
    def index
        @q = Article.ransack(params[:q])
        @articles = @q.result.order(id: :desc)
    end

    def show
        @article.update(view_count: @article.view_count + 1)
    end

    def new
        @article = current_user.articles.build
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to article_path(@article.id), notice: "create article success!"
        else
            flash.now[:alert] = "something error, pls try again..."
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to article_path(@article.id), notice: "update article success!"
        else
            flash.now[:alert] = "something error, pls try again..."
            render :edit
        end
    end

    def destroy
        @aritcle.destroy
        redirect_to dashboard_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :category, :content, :cover_photo, images: [])
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
