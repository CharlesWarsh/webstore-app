Image.create!([
  {image_url: "http://i.imgur.com/VYWBROd.png", product_id: "1"},
  {image_url: "http://i.imgur.com/30Lyaeu.png", product_id: "2"},
  {image_url: "http://i.imgur.com/GXl0WT6.png", product_id: "3"},
  {image_url: "http://i.imgur.com/bhEHS5N.png", product_id: "4"},
  {image_url: "http://i.imgur.com/6D77TCs.jpg", product_id: "5"},
  {image_url: "http://i.imgur.com/3lO8IOs.gif", product_id: "6"},
  {image_url: "http://i.imgur.com/xIsYCH1.png", product_id: "1"},
  {image_url: "http://i.imgur.com/g1aCuv4.png", product_id: "1"},
  {image_url: "http://i.imgur.com/HT66Omj.png", product_id: "2"}
])
Order.create!([
  {user_id: 1, product_id: 2, quantity: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 3, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 4, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 5, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 6, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 7, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 8, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: nil, quantity: 3, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 3, quantity: 4, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 3, quantity: 6, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 4, quantity: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 1, quantity: 6, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 3, quantity: 3, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 4, quantity: 7, subtotal: "349650.0", tax: nil, total: nil},
  {user_id: 1, product_id: 3, quantity: 1, subtotal: "40750.0", tax: "3667.5", total: "44417.5"},
  {user_id: 1, product_id: 3, quantity: 3, subtotal: "122250.0", tax: "11002.5", total: "133252.5"},
  {user_id: 1, product_id: 2, quantity: 2, subtotal: "65900.0", tax: "5931.0", total: "71831.0"},
  {user_id: 1, product_id: 4, quantity: 4, subtotal: "199800.0", tax: "17982.0", total: "217782.0"}
])
Product.create!([
  {product_name: "2 Series", price: "32100.0", description: "The performance, downright powerful. The curves, hardly believable. The heritage, rich in sport. The feel of the ride, undeniably BMW. And the chance to drive it? Sheer joy. Meet the BMW 2 Series. Available in a coupe and a convertible.", key_points: "0-60 MPH IN AS QUICK AS 4.4 SECONDS*320 TOP HORSEPOWER*2015 IIHS TOP SAFETY PICK", in_stock: nil, supplier_id: 1},
  {product_name: "3 Series", price: "32950.0", description: "In 1975, BMW sparked a revolution with the 3 Series. And 40 years later, it's still the benchmark of the segment it invented. Forever evolving, its style and handling make it the most popular Series in the lineup. Each of its three models—Sedan, Sports Wagon and Gran Turismo—guarantee the ultimate thrills.", key_points: "300 TOP HORSEPOWER*50/50 NEAR PERFECT WEIGHT DISTRIBUTION*0-60 MPH IN AS QUICK AS 5.1 SECONDS", in_stock: nil, supplier_id: 1},
  {product_name: "4 Series", price: "40750.0", description: "It's impossible to see the BMW 4 Series Coupe, Convertible and Gran Coupe and not feel their athleticism. Yes, they were born from the iconic 3 Series. But, a sleeker, more aggressive design matched with thrilling power makes each 4 Series model stand out in its own beguiling way.", key_points: "300 TOP HORSEPOWER*50/50 NEAR-PERFECT WEIGHT-DISTRIBUTION*0-60 MPH IN AS QUICKLY AS 4.7 SECONDS", in_stock: nil, supplier_id: 2},
  {product_name: "5 Series", price: "49950.0", description: "For 41 years, the 5 Series Sedan has provided the perfect balance of elegant luxury, classic style, and of course, sporty performance. And now with the addition of the unique Gran Turismo, both body styles offer intelligent appointments, outstanding comfort and exceptionally handsome looks perfect for the discerning driver.", key_points: "41 YEARS OF REFINEMENT*445 TOP HORSEPOWER*0-60 MPH IN AS QUICK AS 4.3 SECONDS", in_stock: nil, supplier_id: 2},
  {product_name: "testy2", price: "1.5", description: "test2", key_points: "test2", in_stock: nil, supplier_id: 3},
  {product_name: "test8", price: "0.0", description: "test8", key_points: "test8", in_stock: nil, supplier_id: 3}
])
Supplier.create!([
  {name: "Borg Warner", email: "info@borgwarner.com", phone: "1111111111"},
  {name: "ZF", email: "sales@zf.com", phone: "2222222222"},
  {name: "Recaro", email: "hello@recaro.com", phone: "3333333333"}
])
