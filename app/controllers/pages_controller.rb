class PagesController < ApplicationController
    before_action :check_role, only: %i[dashboard]

    def home
    end

    def about_us
    end

    def service_item_card
    end

    def core_value_card
    end

    def dashboard
        @products = Product.all.limit(10)
        @users = User.all.limit(10)
        @q = Article.ransack(params[:q])
        @articles = @q.result.order(id: :desc).limit(10)
    end

    private

    def check_role
        if current_user.nil? || current_user.role != "admin"
            redirect_to root_path
        end
    end
end
