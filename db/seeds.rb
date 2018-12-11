puts 'Cleaning database...'
Review.destroy_all
Item.destroy_all
Picture.destroy_all
Meal.destroy_all
Order.destroy_all
User.destroy_all

puts 'Creating meals...'

require 'date'


u1 = User.new(email: "margaux@gmail.com", username: "margaux", password: "margaux", usertype: "cook", address: "42 Boulevard de la Résistance, Casablanca")
u1.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544030876/mcsqueeze.jpg"
u1.save!
u2 = User.new(email: "anna@gmail.com", username: "anna", password: "margaux", usertype: "cook", address: "12 Rue Arfoud, Rabat")
u2.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544030876/mcsqueeze.jpg"
u2.save!
u3 = User.new(email: "gabriele@gmail.com", username: "gabriele", password: "margaux", usertype: "cook", address: "4 Rue Tanger, Rabat")
u3.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544030876/mcsqueeze.jpg"
u3.save!

# Customer

m1 = Meal.create!(title: "Couscous", user: u1, published: true, description: "Delicious, savory chicken couscous with tfaya", maxservings: 24, category: "main course", price: 50)
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
Order.create(pickuptime: d1, user: u1)


m2 = Meal.create(title: "Rfissa", user: u1, published: true, description: "Scrumptous chicken with msimmon and helba", maxservings: 12, category: "main course", price: 45)
p2 = Picture.new
p2.meal = m2
p2.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920340/3360437195_4ea3d4441e.jpg"
p2.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)


m3 = Meal.create(title: "Msimmon", user: u2, published: true, description: "Savory, fried, traditional bread", maxservings: 25, category: "side", price: 6)
p3 = Picture.new
p3.meal = m3
p3.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920377/IMG_6816_Fotor_Fotor.jpg"
p3.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m4 = Meal.create(title: "Harsha", user: u2, published: true, description: "Buttery cornbread great with honey & cheese", maxservings: 20, category: "side", price: 4)
p4 = Picture.new
p4.meal = m4
p4.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920395/harcha.jpg"
p4.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u3)

m5 = Meal.create(title: "Beef & Prune Tajine", published: true, user: u3, description: "Stewed and tender beef with plump prunes in a savoury sauce", maxservings: 10, category: "main course", price: 35)
p5 = Picture.new
p5.meal = m5
p5.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920260/morrocan_beef_tagine_15.png"
p5.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u3)

m6 = Meal.create(title: "Lemon Chicken Tagine", published: true, user: u3, description: "Marinated chicken with preserved lemon for a tangy citrus kick", maxservings: 15, category: "main course", price: 40)
p6 = Picture.new
p6.meal = m6
p6.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920232/spiced-chicken-tagine-with-preserved-lemon-and-olives.jpg"
p6.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u3)

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

puts 'Finished!'
