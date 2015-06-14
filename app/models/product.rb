class Product < ActiveRecord::Base
belongs_to :supplier
has_many :images
has_many :orders


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
