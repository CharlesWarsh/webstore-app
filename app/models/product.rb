class Product < ActiveRecord::Base
has_many :images
has_many :orders
has_many :category_tags
has_many :carted_products
has_many :users, through: :carted_products
has_many :categories, through: :category_tags
belongs_to :supplier

validates :product_name, presence: true
validates :product_name, uniqueness: true
validates :price, presence: true
validates :price, numericality: true
validates :description, presence: true


  def sale_message
    price_for_this = price.to_i
    if price_for_this < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    tax = (price.to_f * 0.09)
  end

  def total
    total = tax + price.to_f
  end



end
