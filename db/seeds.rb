# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "hair gel", price: 10.1)
product2 = Product.create(name: "toy gun", price: 15.7)
product3 = Product.create(name: "water bottle", price: 5.5)
product4 = Product.create(name: "ceramic cup", price: 2.0)
product5 = Product.create(name: "pillow case", price: 3.0)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here
:comment
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps

puts "Seeding done!"