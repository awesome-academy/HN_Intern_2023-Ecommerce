User.create!(
  name: "sellertest",
  email: "sellertest@gmail.com",
  phone: "0123456789",
  address: "Hanoi",
  date_of_birth: Date.parse("1990-01-01"),
  gender: 0,
  role: 1,
  password: "123",
  password_confirmation: "123",
  created_at: Time.now,
  updated_at: Time.now
)

User.create!(
  name: "customertest",
  email: "customertest@gmail.com",
  phone: "0123456789",
  address: "Hanoi",
  date_of_birth: Date.parse("1990-01-01"),
  gender: 0,
  role: 0,
  password: "1",
  password_confirmation: "1",
  created_at: Time.now,
  updated_at: Time.now
)

Category.create!(
  name: "categorytest1",
  description: "This is a sample category for demonstration purposes.",
  created_at: Time.now,
  updated_at: Time.now
)

Category.create!(
  name: "categorytest2",
  description: "This is a sample category for demonstration purposes.",
  created_at: Time.now,
  updated_at: Time.now
)

seller = User.first
customer = User.last
categories = Category.all

100.times do 
  des = Faker::Lorem.sentence(word_count: rand(20..40))
  Product.create!(
    name: Faker::Commerce.product_name,
    price: rand(10..2000),
    description: des,
    quantity_on_stock: 100,
    user_id: seller.id,
    category_id: categories.sample.id,
    created_at: Time.now,
    updated_at: Time.now
  )
end

products = Product.all
5.times do
  CartItem.create!(
    quantity: 1,
    user_id: customer.id,
    product_id: products.sample.id,
    created_at: Time.now,
    updated_at: Time.now
  )
end
