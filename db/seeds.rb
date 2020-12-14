# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "nicki@nicki.com", password: "queennicki")
User.create(email: "cardib@cardib.com", password: "wapwapwap")
bowl = Product.create(name: "terra cotta salad bowl", current_price: 19.99)
thermapen = Product.create(name: "Thermapen Mk4", current_price: 99.99)
Product.create(name: "La Creuset Dutch Oven", current_price: 399.99)
Product.create(name: "Pepper Mill", current_price: 49.99)
Product.create(name: "wooden spoon", current_price: 5.00)
Product.create(name: "Japanese mandolinne", current_price: 35.00)
Category.create(name: "Sale")
Category.create(name: "Cookware")
Category.create(name: "Utensils")
newcart = Cart.create
item1 = CartItem.create(product: bowl, quantity: 2, cart: newcart)
item2 = CartItem.create(product: thermapen, quantity: 3, cart: newcart)
item3 = CartItem.create(product: bowl, quantity: 4, cart: newcart)
