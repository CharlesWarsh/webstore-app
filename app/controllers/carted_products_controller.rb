class CartedProductsController < ApplicationController
  before_action :authenticate_user!


  def index
    @products = Product.all
    @carted_products = CartedProduct.all
    @carted_products.each do |carted_product|
      if status == "carted"
        @price = @products.find_by(id: carted_product.product_id).price
        p @price
        @quantity = carted_product.quantity
        p @quantity
        @subtotal += (@price * @quantity)
      end
    end
      #@tax = (@subtotal * 0.09)
      #@total = (@subtotal + @tax)

    #if params[:sort]
     # @products = Product.order(:price)
    #elsif params[:dsort]
     # @products = Product.order(price: :desc)
    #if params[:sort]
     # @products = Product.order(params[:sort] => params[:sort_order])
    #elsif params[:disc]
      #@products = Product.where("price < ?", 40000)
    #elsif params[:random]
      #@products = []
      #@products << Product.all.shuffle.first
    #end
    #if params[:category]
      #@products = Category.find_by(name: params[:category]).products
    #end
    @products = Product.all

  end

  def create
    @product = Product.find_by(id: params[:product_id])
    
    order = CartedProduct.create(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], status: "carted")
    if order.save
      redirect_to "/carted_products"
    else
      render "/products/show"
    end

    flash[:success] = "Carted!"

  end

  def show


  end

  def destroy
    cartedproduct_id = params[:id]
    @cartedproduct = CartedProduct.find_by(id: cartedproduct_id)
    @cartedproduct.update(status: "removed")
    flash[:warning] = "Product Removed!"
    redirect_to "/carted_products"
  end

end
