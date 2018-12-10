puts 'Cleaning database...'
Item.destroy_all
Picture.destroy_all
Meal.destroy_all
Order.destroy_all
User.destroy_all

puts 'Creating meals...'

require 'date'

u1 = User.create(email: "margaux@gmail.com", password: "margaux", usertype: "cook", address: "42 Boulevard de la Résistance, Casablanca")
u2 = User.create(email: "anna@gmail.com", password: "margaux", usertype: "cook", address: "12 Rue Arfoud, Rabat")
u3 = User.create(email: "gabriele@gmail.com", password: "margaux", usertype: "cook", address: "4 Rue Tanger, Rabat")

# Customer
u4 = User.create(email: "hanae@gmail.com", password: "margaux", usertype: "customer")

m1 = Meal.create(title: "Couscous", user: u1, description: "Delicious, savory chicken couscous with tfaya", maxservings: 24, category: "main course", price: 50)
p1 = Picture.new
p1_2 = Picture.new
p1.meal = m1
p1_2.meal = m1
p1.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920319/originalmoroccanfood57-600x398-64.jpg"
p1.save
p1_2.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920340/3360437195_4ea3d4441e.jpg"
p1_2.save
d1 = Date.new(2018,12,1)
d2 = Date.new(2018,12,2)
Order.create(pickuptime: d1, user: u4)

u2 = User.create(email: "maria@gmail.com", password: "123456", usertype: "cook", address: "42 mountbatten, Casablanca")
m2 = Meal.create(title: "Rfissa", user: u2, description: "Scrumptous chicken with msimmon and helba", maxservings: 12, category: "main course", price: 45)
p2 = Picture.new
p2.meal = m2
p2.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920340/3360437195_4ea3d4441e.jpg"
p2.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u4)

m3 = Meal.create(title: "Msimmon", user: u2, description: "Savory, fried, traditional bread", maxservings: 25, category: "side", price: 6)
p3 = Picture.new
p3.meal = m3
p3.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920377/IMG_6816_Fotor_Fotor.jpg"
p3.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u4)

m4 = Meal.create(title: "Harsha", user: u2, description: "Buttery cornbread great with honey & cheese", maxservings: 20, category: "side", price: 4)
p4 = Picture.new
p4.meal = m4
p4.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920395/harcha.jpg"
p4.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u4)

m5 = Meal.create(title: "Beef & Prune Tajine", user: u3, description: "Stewed and tender beef with plump prunes in a savoury sauce", maxservings: 10, category: "main course", price: 35)
p5 = Picture.new
p5.meal = m5
p5.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920260/morrocan_beef_tagine_15.png"
p5.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u4)

m6 = Meal.create(title: "Lemon Chicken Tagine", user: u3, description: "Marinated chicken with preserved lemon for a tangy citrus kick", maxservings: 15, category: "main course", price: 40)
p6 = Picture.new
p6.meal = m6
p6.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920232/spiced-chicken-tagine-with-preserved-lemon-and-olives.jpg"
p6.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u4)

orders = Order.all
meals = [m1, m2, m3, m4, m5, m6]
orders.each do |order|
  3.times do
    item = Item.new
    item.quantity = rand(10)
    item.order = order
    item.meal = meals.sample(1)[0]
    item.save
  end
end


User.create(email: "cook@gmail.com", password: "123456", usertype: "cook", photo: "hhttps://res.cloudinary.com/homeplate/image/upload/v1544030863/ssaunier.jpg")
User.create(email: "customer@gmail.com", password: "123456", usertype: "customer", photo: "https://res.cloudinary.com/homeplate/image/upload/v1544030876/mcsqueeze.jpg")

puts 'Finished!'
