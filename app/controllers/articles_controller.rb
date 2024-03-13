class ArticlesController < ApplicationController
    before_action :set_article, only: [ :edit, :update, :destroy]
    def index
        
    end

    def new
      @article = Article.new
    end

    def create
        @article = Aritcle.new(article_params)
        if @article.save
            riderect_to dashboard_path, notice: "create article success!"
        else
            flash.now[:alert] = "something error, pls try again..."
            render :new
        end
    end

    def edit
        
    end

    def update
        if @article.update(article_params)
            riderect_to dashboard_path, notice: "update article success!"
        else
            flash.now[:alert] = "something error, pls try again..."
            render :edit
        end
    end

    def destroy
      @aritcle.destroy
      riderect_to dashboard_path
    end

    private

    def article_params
      params.require(:article).permit( :title, :category, :content)
    end

    def set_article
        @aritcle = Article.find(params[:id])
    end
end
