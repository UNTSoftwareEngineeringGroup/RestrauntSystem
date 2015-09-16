# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MenuItem.delete_all
5.times do |i|
	MenuItem.create(name: "Item#{i}", description: "Description of ##{i}", calories: "##{i*100}", img: "img/url", ingredients: "ingredient list added here", available: "TRUE")
end