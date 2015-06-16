class CartedProductsControllerController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    
    order = Carted_Product.create(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], status: "carted")
  end

  def show


  end
end
