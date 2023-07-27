User.create!(
  name: "sellertest",
  email: "sellertest@gmail.com",
  phone: "0123456789",
  address: "Hanoi",
  date_of_birth: Date.parse("1990-01-01"),
  gender: 0,
  activated: true,
  role: 1,
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

user = User.first
categories = Category.all

100.times do 
  des = Faker::Lorem.sentence(word_count: rand(20..40))
  Product.create!(
    name: Faker::Commerce.product_name,
    price: rand(10..2000),
    description: des,
    quantity_on_stock: 100,
    user_id: user.id,
    category_id: categories.sample.id,
    created_at: Time.now,
    updated_at: Time.now
  )
end
