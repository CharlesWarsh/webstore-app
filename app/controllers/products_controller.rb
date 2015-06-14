class ProductsController < ApplicationController

  def home
  end

  def index
    @products = Product.all
    #if params[:sort]
     # @products = Product.order(:price)
    #elsif params[:dsort]
     # @products = Product.order(price: :desc)
    if params[:sort]
      @products = Product.order(params[:sort] => params[:sort_order])
    elsif params[:disc]
      @products = Product.where("price < ?", 40000)
    elsif params[:random]
      @products = []
      @products << Product.all.shuffle.first
    end
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def new
  end

  def create
    product = Product.create(product_name: params[:product_name], price: params[:price], image: params[:image], description: params[:description], key_points: params[:key_points])
    flash[:success] = "Product Created!"
    redirect_to "/products/#{product.id}"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update(product_name: params[:product_name], price: params[:price], image: params[:image], description: params[:description], key_points: params[:key_points])
    flash[:success] = "Product Updated!"
    redirect_to "/products/#{product_id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:warning] = "Product Deleted!"
    redirect_to "/products"
  end

  def submit_search
    search_term = params[:search]
    @products = Product.where("product_name LIKE ?", "%#{search_term}%")
    render :index
  end

  def search
  end

  def add_image
  end

  def create_image
    Image.create(product_id: params[:product_id], image_url: params[:image_url])
    flash[:success] = "Image Added!"
    product_id = params[:product_id]
    redirect_to "/products/#{product_id}"
  end

end
