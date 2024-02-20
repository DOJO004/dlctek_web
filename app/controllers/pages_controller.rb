class PagesController < ApplicationController
  def home
  end

  def about_us
  end

  def dashboard
    @products = Product.all
  end

  def store
    @products = Product.where(status: true)
  end
end
