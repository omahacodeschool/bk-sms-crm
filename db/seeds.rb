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
k.name = "ULTRAMAX Real Estate"
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

# This client contains Mike's actual phone number.
# Ditto on the testing availablity
a = Client.new
a.first_name = "Mike"
a.last_name = "Meier"
a.notes = "Just a guy- Not that Wayne's World guy."
a.active = true
a.phone_number = "4025771928"
a.business_id = e.id
a.save

c = Client.new
c.first_name = "Alex"
c.last_name = "Keaton"
c.notes = "Rediculasly right wing, but a snappy dresser."
c.active = true
c.phone_number = "4025552244"
c.business_id = k.id
c.save

d = Client.new
d.first_name = "Peter"
d.last_name = "Brady"
d.notes = "When its time to change... floorplans, big family, needs a big house."
d.active = true
d.phone_number = "4025559213"
d.business_id = e.id
d.save

f = Client.new
f.first_name = "Dan"
f.last_name = "Connor"
f.notes = "Looking for a fixer-upper, he wants to do the work himself."
f.active = true
f.phone_number = "4025554565"
f.business_id = k.id
f.save

g = Client.new
g.first_name = "Kevin"
g.last_name = "Owens"
g.notes = "Snarky dude with a gapped grill."
g.active = true
g.phone_number = "4025552225"
g.business_id = e.id
g.save

h = Client.new
h.first_name = "Ben"
h.last_name = "Seaver"
h.notes = "Lives down the hall from Carol"
h.active = true
h.phone_number = "5025552291"
h.business_id = k.id
h.save
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

p = Touch.new
p.client_id = h.id
p.message = "I hear your the man to see about a house!"
p.outgoing = false
p.read = true
p.save

q = Touch.new
q.client_id = h.id
q.message = "I can deffinately help you with that, what exactly are you looking for?"
q.outgoing = true
q.read = true
q.save

s = Touch.new
s.client_id = h.id
s.message = "I am looking for a 4 bedroom house with a finished basement."
s.outgoing = false
s.read = true
s.save

t = Touch.new
t.client_id = h.id
t.message = "Shouldnt be a problem, are you working with a price range?"
t.outgoing = true
t.read = true
t.save

v = Touch.new
v.client_id = h.id
v.message = "I think I would like to stay as cheap as possible."
v.outgoing = false
v.read = true
v.save

i = Touch.new
i.client_id = h.id
i.message = "Is there an area of town you would like to live in?"
i.outgoing = true
i.read = true
i.save

j = Touch.new
j.client_id = h.id
j.message = "Dundee"
j.outgoing = false
j.read = true
j.save

p2 = Touch.new
p2.client_id = c.id
p2.message = "I got your card from a friend, I am looking for a house."
p2.outgoing = false
p2.read = true
p2.save

q2 = Touch.new
q2.client_id = c.id
q2.message = "I would love to help you, have you looked at all?"
q2.outgoing = true
q2.read = true
q2.save

s2 = Touch.new
s2.client_id = c.id
s2.message = "I really havent, you are the first number I called"
s2.outgoing = false
s2.read = true
s2.save

t2 = Touch.new
t2.client_id = c.id
t2.message = "No problem at all, I can start putting some thing together for you now."
t2.outgoing = true
t2.read = true
t2.save

v2 = Touch.new
v2.client_id = c.id
v2.message = "Sounds great, do you want some input from me at all?"
v2.outgoing = false
v2.read = true
v2.save

i2 = Touch.new
i2.client_id = c.id
i2.message = "Wouldnt hurt, what kind of house are you looking for?"
i2.outgoing = true
i2.read = true
i2.save

j2 = Touch.new
j2.client_id = c.id
j2.message = "A bedroom 3 bedroom 2 bath would be great, what do you have?"
j2.outgoing = false
j2.read = false
j2.save

