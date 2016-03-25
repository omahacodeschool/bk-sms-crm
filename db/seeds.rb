# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

x = User.new
x.phone_number = "+14028502532" 
x.email ="user@gmail.com"
x.password = "password"
x.save

# /////////////////////////////////////////////////

b = Business.new
b.user_id = x.id
b.name = "Moo-Moo Steakhouse"
b.business_phone = "+14028502532"
b.save

r = Business.new
r.user_id = x.id
r.name = "Real-Bearded Santa Exotic Dancers"
r.business_phone = "+14028502532"
r.save

e = Business.new
e.user_id = x.id
e.name = "Stuff To Put On Your Face, LLC"
e.business_phone = "+14028502532"
e.save

k = Business.new
k.user_id = x.id
k.name = "QWERTY Keyboard Cleaning"
k.business_phone = "+14028502532"
k.save

# /////////////////////////////////////////////////

# Client(y) Contains Jeremy's actual phone number. 
# Feel free to test between 7am and 9pm.  
y = Client.new
y.first_name = "Jeremy"
y.last_name = "Stoll"
y.notes = "Likes to buy things that are pink or involving cats"
y.active = true
y.phone_number = "+14022133739"
y.business_id = r.id
y.save

a = Client.new
a.first_name = "Mike"
a.last_name = "Myers"
a.notes = "Just a guy- Not that Wayne's World guy."
a.active = true
a.phone_number = "4025771928"
a.business_id = b.id
a.save

# /////////////////////////////////////////////////

z = Touch.new
z.client_id = y.id
z.message = "Yes, we do sell pink things."
z.outgoing = true
z.read = false
z.save

n = Touch.new
n.client_id = y.id
n.message = "May we schedule a cat calendar demo?"
n.outgoing = true
n.read = false
n.save

u = Touch.new
u.client_id = a.id
u.message = "I need some things you sell."
u.outgoing = false
u.read = false
u.save

w = Touch.new
w.client_id = a.id
w.message = "I'd love to buy those things!"
w.outgoing = false
w.read = true
w.save
