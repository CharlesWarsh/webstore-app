class Order < ActiveRecord::Base
belongs_to :user
belongs_to :product

def calculate_subtotal(price)
  quantity * price
end

def calculate_tax(price)
  price * 0.09
end

def calculate_total(price)
  quantity * price * 1.09
end

end
