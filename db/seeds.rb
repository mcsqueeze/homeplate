puts 'Cleaning database...'
Meal.destroy_all
Order.destroy_all


puts 'Creating meals...'

require 'date'

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m1 = Meal.create(title: "Couscous", user: User.first, description: "Delicious, savory chicken couscous with tfaya", category: "main course", price: "50.00")
p1 = Picture.new
p1.meal = m1
p1.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920319/originalmoroccanfood57-600x398-64.jpg"
p1.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m1, picture: p1)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m2 = Meal.create(title: "Rfissa", user: User.first, description: "Scrumptous chicken with msimmon and helba", category: "main course", price: "45.00")
p2 = Picture.new
p2.meal = m2
p2.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920340/3360437195_4ea3d4441e.jpg"
p2.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m2, picture: p2)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m3 = Meal.create(title: "Msimmon", user: User.first, description: "Savory, fried, traditional bread", category: "side", price: "6.00")
p3.meal = m3
p3.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920377/IMG_6816_Fotor_Fotor.jpg"
p3.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m3, picture: p3)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m4 = Meal.create(title: "Harsha", user: User.first, description: "Buttery cornbread great with honey & cheese", category: "side", price: "4.00")
p4 = Picture.new
p4.meal = m4
p4.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920377/IMG_6816_Fotor_Fotor.jpg"
p4.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m4, picture: p4)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m5 = Meal.create(title: "Beef & Prune Tajine", user: User.first, description: "Stewed and tender beef with plump prunes in a savoury sauce", category: "main course", price: "35.00")
p5 = Picture.new
p5.meal = m5
p5.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920260/morrocan_beef_tagine_15.png"
p5.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m5, picture: p5)

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook")
m6 = Meal.create(title: "Lemon Chicken Tagine", user: User.first, description: "Marinated chicken with preserved lemon for a tangy citrus kick", category: "main course", price: "40.00")
p6 = Picture.new
p6.meal = m6
p6.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920232/spiced-chicken-tagine-with-preserved-lemon-and-olives.jpg"
p6.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(start_date: d1, end_date: d2, user: User.first, meal: m6, picture: p6)


User.create(email: "cook@gmail.com", password: "123456", usertype: "cook")
User.create(email: "customer@gmail.com", password: "123456", usertype: "customer")

puts 'Finished!'
