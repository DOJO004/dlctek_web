class PagesController < ApplicationController
  def home
  end
  def dashboard
    @products = Product.all
  end
end
