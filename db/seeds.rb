# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

x = User.new
x.phone_number = "1111111111"
x.email ="user@gmail.com"
x.password = "password"
x.save

# /////////////////////////////////////////////////

y = Client.new
y.first_name = "Lily"
y.last_name = "Tomlin"
y.notes = "Likes to buy stuff"
y.active = true
y.phone_number = "6666666666"
y.save

a = Client.new
a.first_name = "John"
a.last_name = "Updike"
a.notes = "Just a guy"
a.active = true
a.phone_number = "1111111111"
a.save

# /////////////////////////////////////////////////

b = Business.new
b.user_id = x.id
b.name = "Moo-Moo Steakhouse"
b.business_phone = "3333333333"
b.save

r = Business.new
r.user_id = x.id
r.name = "Real-Bearded Santa Exotic Dancers"
r.business_phone = "2222222222"
r.save

e = Business.new
e.user_id = x.id
e.name = "Stuff To Put On Your Face, LLC"
e.business_phone = "9999999999"
e.save

k = Business.new
k.user_id = x.id
k.name = "QWERTY Keyboard Cleaning"
k.business_phone = "0000000000"
k.save

# /////////////////////////////////////////////////

z = Touch.new
z.client_id = y.id
z.message = "Yes, we do sell things."
z.outgoing = true
z.read = false
z.business_id = b.id
z.save

n = Touch.new
n.client_id = y.id
n.message = "May we schedule a demo?"
n.outgoing = true
n.read = false
n.business_id = r.id
n.save

u = Touch.new
u.client_id = a.id
u.message = "I need some things you sell."
u.outgoing = false
u.read = false
u.business_id = e.id
u.save

w = Touch.new
w.client_id = a.id
w.message = "I'd love to buy those things!"
w.outgoing = false
w.read = true
w.business_id = k.id
w.save
