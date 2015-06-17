class OrdersController < ApplicationController
  def create
  subtotal = 0

  @product = Product.find_by(id: params[:product_id])
  @products = Product.all
  @carted_products = CartedProduct.all
  
  @carted_products.each do |carted_product|
    if carted_product.status == "carted"
      @price = @products.find_by(id: carted_product.product_id).price
      @quantity = carted_product.quantity
      subtotal += (@price * @quantity)
      carted_product.update({status: "purchased"}, {order_id: order.id})
    end
  end

    tax = subtotal * 0.09
    total = subtotal + tax
    
    order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)

    #order.subtotal = order.calculate_subtotal(price)
    #order.tax = order.calculate_tax(price)
    #order.total = order.calculate_total(price)

    flash[:success] = "Order Created!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    @users = User.all
    @email = @users[current_user.id - 1].email
  end
end
