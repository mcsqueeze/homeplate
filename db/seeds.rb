puts 'Cleaning database...'
Meal.destroy_all
Order.destroy_all


puts 'Creating meals...'

require 'date'

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m1 = Meal.new(title: "Couscous", user: User.first, description: "Delicious, savory chicken couscous with tfaya", category: "main course", price: "50.00")
m1.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920319/originalmoroccanfood57-600x398-64"
m1.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m1)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m2 = Meal.new(title: "Rfissa", user: User.first, description: "Scrumptous chicken with msimmon and helba", category: "main course", price: "45.00")
m2.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920340/3360437195_4ea3d4441e"
m2.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m2)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m3 = Meal.new(title: "Msimmon", user: User.first, description: "Savory, fried, traditional bread", category: "side", price: "6.00")
m3.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920377/IMG_6816_Fotor_Fotor"
m3.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m3)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m4 = Meal.new(title: "Harsha", user: User.first, description: "Buttery cornbread great with honey & cheese", category: "side", price: "4.00")
m4.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920395/harcha"
m4.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m4)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m5 = Meal.new(title: "Beef & Prune Tajine", user: User.first, description: "Stewed and tender beef with plump prunes in a savoury sauce", category: "main course", price: "35.00")
m5.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920260/morrocan_beef_tagine_15"
m5.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m5)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m6 = Meal.new(title: "Lemon Chicken Tagine", user: User.first, description: "Marinated chicken with preserved lemon for a tangy citrus kick", category: "main course", price: "40.00")
m6.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920232/spiced-chicken-tagine-with-preserved-lemon-and-olives"
m6.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m6)


User.create(email: "cook@gmail.com", password: "123456", usertype: "cook")
User.create(email: "customer@gmail.com", password: "123456", usertype: "customer")

puts 'Finished!'
