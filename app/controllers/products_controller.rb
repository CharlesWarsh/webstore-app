class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :create]

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
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end

  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def new
    unless user_signed_in? && current_user.admin
      redirect_to "/"
    end
  end

  def create
      product = Product.create(product_name: params[:product_name], price: params[:price], description: params[:description], key_points: params[:key_points])
      flash[:success] = "Product Created!"
      redirect_to "/products/#{product.id}"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    if user_signed_in? && current_user.admin
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      @product.update(product_name: params[:product_name], price: params[:price], description: params[:description], key_points: params[:key_points])
      flash[:success] = "Product Updated!"
      redirect_to "/products/#{product_id}"
    else
      redirect_to "/"
    end
  end

  def destroy
    unless user_signed_in? && current_user.admin
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      @product.destroy
      flash[:warning] = "Product Deleted!"
    end
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
    unless user_signed_in? && current_user.admin
      Image.create(product_id: params[:product_id], image_url: params[:image_url])
      flash[:success] = "Image Added!"
      product_id = params[:product_id]
      redirect_to "/products/#{product_id}"
    else
      redirect_to "/"
    end
  end

  def authenticate_admin!
    unless user_signed_in? && current_user.admin
      redirect_to "/"
    end
  end

end
