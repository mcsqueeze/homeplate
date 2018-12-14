puts 'Cleaning database...'


Item.destroy_all
Picture.destroy_all
Review.destroy_all
Meal.destroy_all
Order.destroy_all
User.destroy_all



puts 'Creating meals...'

require 'date'


u1 = User.new(email: "hayat@gmail.com", username: "Hayat", password: "123456", usertype: "cook", phonenumber: "06 78 54 76 43", address: "42 Boulevard de la Résistance, Casablanca")
u1.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544722516/KHALIL.jpg"
u1.save!

u2 = User.new(email: "Mohammed@gmail.com", username: "Mohammed", password: "123456", usertype: "cook", phonenumber: "06 78 54 76 43", address: "12 Rue Arfoud, Rabat")
u2.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544722517/adherents_raja_1.jpg"
u2.save!

u3 = User.new(email: "mouna@gmail.com", username: "Mouna", password: "123456", usertype: "cook", phonenumber: "06 78 54 76 43", address: "4 Rue Tanger, Rabat")
u3.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544722516/Choumicha.jpg"
u3.save!

u4 = User.new(email: "rachida@gmail.com", username: "Rachida", password: "123456", usertype: "cook", phonenumber: "06 78 54 76 43", address: "4 Rue Tanger, Rabat")
u4.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544722516/ayesha.jpg"
u4.save!


u5 = User.new(email: "jacques@gmail.com", username: "Jacques", password: "123456", usertype: "cook", phonenumber: "06 78 54 76 43", address: "4 Rue Tanger, Rabat")
u5.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544777993/JACQUES-1600X938-V2.jpg"
u5.save!

u6 = User.new(email: "mounia@gmail.com", username: "Mounia", password: "123456", usertype: "cook", phonenumber: "06 78 54 76 43", address: "4 Rue Tanger, Rabat")
u6.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544777755/zfkNiosF.jpg"
u6.save!

u7 = User.new(email: "rabab@gmail.com", username: "Rabab", password: "123456", usertype: "customer", phonenumber: "06 78 54 76 43", address: "4 Rue Tanger, Rabat")
u7.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544777800/lKCxCYSD_400x400.jpg"
u7.save!

u8 = User.new(email: "fadwa@gmail.com", username: "Fadwa", password: "123456", usertype: "customer", phonenumber: "06 78 54 76 43", address: "42 Boulevard de la Résistance, Casablanca")
u8.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544778113/asa-hutchinson.jpg"
u8.save!

u9 = User.new(email: "abdel@gmail.com", username: "Abdel", password: "123456", usertype: "customer", phonenumber: "06 78 54 76 43", address: "42 Boulevard de la Résistance, Casablanca")
u9.remote_photo_url = "https://res.cloudinary.com/homeplate/image/upload/v1544778198/amr.jpg"
u9.save!




# Customer

m1 = Meal.create!(title: "Couscous", user: u1, published: true, description: "Delicious, savory chicken couscous with tfaya", maxservings: 24, category: "main course", price: 50)
p1 = Picture.new
p1_2 = Picture.new
p1_3 = Picture.new
p1.meal = m1
p1_2.meal = m1
p1_3.meal = m1
p1.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920319/originalmoroccanfood57-600x398-64.jpg"
p1.save
p1_2.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544740543/DQmZgayfZp3TKJi9k427RLGN4LowLzxb1t6CPomHL8qBUM1-750x630.jpg"
p1_2.save
p1_3.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544740593/00000153-00000327.jpg"
p1_3.save
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

m4 = Meal.create(title: "Harsha", user: u3, published: true, description: "Buttery cornbread great with honey & cheese", maxservings: 20, category: "side", price: 4)
p4 = Picture.new
p4.meal = m4
p4.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920395/harcha.jpg"
p4.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u1)

m5 = Meal.create(title: "Beef & Prune Tajine", published: true, user: u4, description: "Stewed and tender beef with plump prunes in a savoury sauce", maxservings: 10, category: "main course", price: 35)
p5 = Picture.new
p5.meal = m5
p5.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920260/morrocan_beef_tagine_15.png"
p5.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u3)

m6 = Meal.create(title: "Lemon Chicken Tagine", published: true, user: u4, description: "Marinated chicken with preserved lemon for a tangy citrus kick", maxservings: 15, category: "main course", price: 40)
p6 = Picture.new
p6.meal = m6
p6.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1543920232/spiced-chicken-tagine-with-preserved-lemon-and-olives.jpg"
p6.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u3)

m7 = Meal.create(title: "Hummus", published: true, user: u3, description: "Crushed chickpeas with sesame cream", maxservings: 15, category: "side", price: 5)
p7 = Picture.new
p7_2 = Picture.new
p7.meal = m7
p7_2.meal = m7
p7.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723146/hummus-horizontal-jpg-1525126330.jpg"
p7.save
p7_2.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544740845/21COOKING-HUMMUS1-articleLarge.jpg"
p7_2.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u1)

m8 = Meal.create(title: "Zaalouk", published: true, user: u5, description: "Mixed stir vegetables", maxservings: 15, category: "side", price: 10)
p8 = Picture.new
p8.meal = m8
p8.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723189/Zaalouk-with-crispy-halloumi-527ab3c.jpg"
p8.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m9 = Meal.create(title: "Paella", published: true, user: u6, description: "Fragrant rice with mixed seafood", maxservings: 12, category: "main dish", price: 30)
p9 = Picture.new
p9_2 = Picture.new
p9.meal = m9
p9.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723247/Seafood-Paella-LEAD-VERTICAL.jpg"
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m10 = Meal.create(title: "Pastilla", published: true, user: u6, description: "Savoury pastry stuffed with chicken and almonds.", maxservings: 14, category: "main dish", price: 20)
p10 = Picture.new
p10_2 = Picture.new
p10.meal = m10
p10_2.meal = m10
p10.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723792/w-pastilla-honey-co-1434485679.jpg"
p10.save
p10_2.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544739956/pastilla-5.jpg"
p10_2.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m11 = Meal.create(title: "Black Forest Cake", published: true, user: u2, description: "Layered chocolate cake with cream and cherry filling.", maxservings: 24, category: "dessert", price: 10)
p11 = Picture.new
p11.meal = m11
p11.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544724036/Black-Forest-Cake-Recipe.jpg"
p11.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m12 = Meal.create(title: "Greek Salad", published: true, user: u3, description: "Fresh, delicious salad with olives and feta cheese.", maxservings: 20, category: "side", price: 20)
p12 = Picture.new
p12.meal = m12
p12.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723689/horiatiki-greek-salad-today-041618-tease_79c5041ae6a58da5e333029bbe2c4b88.jpg"
p12.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m13 = Meal.create(title: "Pasta", published: true, user: u3, description: "Pasta with cherry tomatoes and basil.", maxservings: 10, category: "main dish", price: 20)
p13 = Picture.new
p13.meal = m13
p13.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723639/20160827-cherry-tomato-pasta-13-1500x1125.jpg"
p13.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

m14 = Meal.create(title: "Briwat", published: true, user: u4, description: "Sweet moroccan dessert with honey.", maxservings: 25, category: "dessert", price: 4)
p14 = Picture.new
p14.meal = m14
p14.remote_url_url = "https://res.cloudinary.com/homeplate/image/upload/v1544723946/recipe1574.jpg"
p14.save
d1 = Date.new(2018,12,1)
Order.create(pickuptime: d1, user: u2)

r1 = Review.create(rating: "4", content: "pretty good couscous, very fair price.", meal: m1, cook: u1, user: u7)
r2 = Review.create(rating: "4.5", content: "LOVE THIS COUSCOUS!!!", meal: m1, cook: u1, user: u8)

r3 = Review.create(rating: "4", content: "very convenient, good taste.", meal: m3, cook: u2, user:u7)

r4 = Review.create(rating: "5", content: "so delicious, loved it!", meal: m3, cook: u2, user:u8)

r5 = Review.create(rating: "5", content: "5-star meal, will reorder.", meal: m7, cook: u3, user:u7)

r6 = Review.create(rating: "4", content: "ultra smooth hummus, friendly cook", meal: m7, cook: u3, user:u8)

r7 = Review.create(rating: "3", content: "I've had better, average!", meal: m6, cook: u4, user:u7)

r8 = Review.create(rating: "4", content: "lemoney, chickeny goodness.", meal: m6, cook: u4, user:u8)

r9 = Review.create(rating: "5", content: "just like my mother<s zaalouk", meal: m8, cook: u5, user: u7)

r10 = Review.create(rating: "5", content: "great flavours, nicely seasoned.", meal: m8, cook: u5, user:u8)

r11 = Review.create(rating: "3.5", content: "i've had better, but good portion.", meal: m10, cook: u6, user:u7)

r12 = Review.create(rating: "4", content: "i liked this dish a lot, will order again", meal: m10, cook: u6, user:u8)

r13 = Review.create(rating: "4", content: "pretty good couscous, nicely plated", meal: m2, cook: u1, user:u7)

r14 = Review.create(rating: "3", content: "a bit too oily, but good value.", meal: m3, cook: u2, user: u9)

r15 = Review.create(rating: "5", content: "looove this hummus!", meal: m7, cook: u3, user:u9)

r16 = Review.create(rating: "4", content: "very tender beef", meal: m5, cook: u4, user:u7)

r17 = Review.create(rating: "4", content: "tajine had a great sauce", meal: m8, cook: u5, user:u9)

r18 = Review.create(rating: "4.5", content: "delicious pastilla, would eat it every day", meal: m10, cook: u6, user:u9)

r19 = Review.create(rating: "4", content: "very good, a bit too salty", meal: m5, cook: u4, user:u8)

r20 = Review.create(rating: "4", content: "good value, good taste.", meal: m7, cook: u3, user:u9)

r21 = Review.create(rating: "4.5", content: "i definitely recommend this cook.", meal: m3, cook: u2, user:u9)

r22 = Review.create(rating: "4.5", content: "best cook ever!", meal: m1, cook: u1, user:u9)


orders = Order.all
meals = [m1, m2, m3, m4, m5, m6, m7, m8]
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
