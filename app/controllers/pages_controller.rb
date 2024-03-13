class PagesController < ApplicationController
  before_action :check_role, only: [:dashboard]
  def home
  end

  def about_us
  end

  def dashboard
    @products = Product.all
    @users = User.all
    @articles = Article.order(id: :desc).limit(10)
  end

  private

  def check_role
    if current_user.nil? || current_user.role != "admin"
      redirect_to root_path
    end
  end
end
