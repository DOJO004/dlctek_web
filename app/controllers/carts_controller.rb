class CartsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_cart, only: :add_cart

    def show
        @cart = current_user.cart
        @cart_items = current_user.cart.cart_items if current_user
        @total = 0
    end

    def edit
        @item = CartItem.find(params[:id])
        @product = Product.find(CartItem.find(params[:id]).product_id)
        @subtotal = @product.price * @item.amount
    end

    def update
        @item = CartItem.find(params[:id])

        if @item.update(cart_item_params)
            redirect_to cart_path(current_user.cart.id)
        else
            flash.now[:alert] = "pls checked messagess..."
        end
    end

    def add_cart(id: params[:id])
        @cart = current_user.cart
        cart_item = @cart.cart_items.find_by(product_id: id)

        if cart_item.present?
            cart_item.increment!(:amount)
        else
            @cart.cart_items.create(product_id: id, amount: 1)
        end

        redirect_to store_path, notice: "Add to cart success!"
    end

    def delete_cart_item(id: params[:id])
        @item = CartItem.find(id)
        if @item.destroy
            redirect_to cart_path(current_user.cart.id)
        end
    end

    private

    def check_cart
        if current_user.cart.nil?
            @cart = current_user.create_cart
        end
    end

    def cart_item_params
        params.require(:cart_item).permit(:amount)
    end
end
