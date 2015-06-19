class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
  subtotal = 0

  @product = Product.find_by(id: params[:product_id])
  @products = Product.all
  @carted_products = CartedProduct.all
  
  order = Order.create

  @carted_products.each do |carted_product|
    if carted_product.status == "carted"
      @price = @products.find_by(id: carted_product.product_id).price
      @quantity = carted_product.quantity
      subtotal += (@price * @quantity)
      carted_product.update(status: "purchased", order_id: order.id)
    end
  end

    tax = subtotal * 0.09
    total = subtotal + tax
    
    order.update(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)

    #order.subtotal = order.calculate_subtotal(price)
    #order.tax = order.calculate_tax(price)
    #order.total = order.calculate_total(price)

    flash[:success] = "Order Created!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @carted_products = CartedProduct.all
    @order_id = Order.all.last.id
    @products = Product.all
  end
end
