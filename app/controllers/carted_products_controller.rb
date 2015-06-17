class CartedProductsController < ApplicationController


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

    flash[:success] = "Carted!"
    redirect_to "/carted_products/"

  end

  def show


  end

end
