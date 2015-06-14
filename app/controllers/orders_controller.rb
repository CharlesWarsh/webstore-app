class OrdersController < ApplicationController
  def create
    @product = Product.find_by(id: params[:product_id])
    
    price = @product.price
    subtotal = price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    
    order = Order.create(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], subtotal: subtotal, tax: tax, total: total)

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
