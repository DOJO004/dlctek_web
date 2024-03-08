class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    def index
        @products = Product.where(status: true)
    end

    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to dashboard_path, notice: "add product success!"
        else
            flash.now[:alert] = "try again"
            render :new
        end
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to dashboard_path, notice: "update product success!"
        else
            flash.now[:alert] = "try again"
            render :edit
        end
    end

    def destroy
        @product.destroy
        redirect_to dashboard_path
    end

    private

    def product_params
        params.require(:product).permit(:title, :descript, :amount, :price, :status)
    end

    def set_product
        @product = Product.find(params[:id])
    end
end
