class PagesController < ApplicationController
  before_action :check_role, only: [:dashboard]
  def home
  end

  def about_us
  end

  def service_item_card
    
  end

  def dashboard
    @products = Product.all
    @users = User.all
    @q = Article.ransack(params[:q])
    @articles = @q.result.order(id: :desc)
  end

  private

  def check_role
    if current_user.nil? || current_user.role != "admin"
      redirect_to root_path
    end
  end
end
