class CartItemsController < ApplicationController
  before_action :logged_in?
  before_action :current_cart, only: [:show, :create, :search_current_cart_items]
  before_action :search_current_cart_items, only: [:create, :destroy]

  def blank?
    find_items = CartItem.find_by(product_id: params[:cart_item][:product_id])
    if find_items.nil?
      return true
    else
      return false
    end
  end

  def create
    if blank?
      add_item = @current_cart.cart_items.build(add_item_params)
      if add_item.save
        flash.now[:success] = "商品をカートに追加しました。"
      else
        flash.now[:danger] = "商品をカートに追加できませんでした。お手数ですが、もう一度カートに追加してください。"
      end
      redirect_to products_path
    else
      flash[:danger] = "すでに商品が入っています。数量の変更はカートページからお願い致します。"
      redirect_to cart_items(current_user.id)
    end
  end

  def show
    cart = Cart.find_by(user_id: current_user.id)
    @cart_items = CartItem.where(cart_id: cart.id)
  end

  def update
  end

  def destroy
  end


  private

  def current_cart
    cart = Cart.find_by(user_id: current_user)
    if cart
      @current_cart = cart
    else
      @current_cart = Cart.create(user_id: current_user.id)
    end
  end

  def search_current_cart_items
    @cart_items = current_cart.cart_items.find_by(product_id: params[:product_id])
  end

  # def set_cart
  #   @cart = current_cart
  # end

  def add_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
