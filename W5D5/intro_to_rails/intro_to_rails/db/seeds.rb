# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
House.destroy_all
malloch = House.create(address: '1360 Montgomery St')
ardee = House.create(address: '2485 Ardee Ln')
lowell = House.create(address: '6108 Lowell St')

Person.destroy_all
danna = Person.create(name: 'Danna', house_id: malloch.id)
matt = Person.create(name: 'Matthew', house_id: ardee.id)
boba = Person.create(name: 'Boba', house_id: ardee.id)
mochi = Person.create(name: 'Mochi', house_id: lowell.id)

# house = House.new(address: '308 Negra Arroyo Lane')
# person = Person.new(name: 'Walter White', house_id: house.id)

# house.save!
# person.save!