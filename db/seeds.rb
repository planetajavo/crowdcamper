# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |i|

	k= i+1

	u = User.create email: "user#{k}@example.com", password: "12345678"

	p = Van.create brand: "Volkswagen#{k}", model: "California", price: 40, year: 1992, description: "Esta es la descripcion de la furgoneta"

	p.locations.create country: "Spain", city: "Madrid", street: "Calle Atocha", number: "3"
	
	

end

10.times do |i|

	k= i+1

	p = Van.create brand: "Volkswagen#{k}", model: "Multivan", price: 30, year: 1999, description: "Esta es la descripcion de la furgoneta"

	p.locations.create country: "Spain", city: "Valencia", street: "Calle Atocha", number: "3"
	
	

end



