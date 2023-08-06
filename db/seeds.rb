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
