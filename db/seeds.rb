# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat = ServiceCategory.create(name: 'Musik')
ServiceSubCategory.create(name: 'DJ', serviceCategory: cat)
ServiceSubCategory.create(name: 'Band', serviceCategory: cat)
ServiceSubCategory.create(name: 'Soloist', serviceCategory: cat)


cat = ServiceCategory.create(name: 'Essen')
ServiceSubCategory.create(name: 'Koch', serviceCategory: cat)
ServiceSubCategory.create(name: 'Buffet-Caterer', serviceCategory: cat)
ServiceSubCategory.create(name: 'Lieferservice', serviceCategory: cat)


cat = ServiceCategory.create(name: 'Transport')
ServiceSubCategory.create(name: 'Kutsche', serviceCategory: cat)
ServiceSubCategory.create(name: 'Taxi', serviceCategory: cat)
ServiceSubCategory.create(name: 'Limousinen Service', serviceCategory: cat)
ServiceSubCategory.create(name: 'Bus', serviceCategory: cat)


cat = ServiceCategory.create(name: 'Dekorateur')
ServiceSubCategory.create(name: 'Florist', serviceCategory: cat)


cat = ServiceCategory.create(name: 'Trinken')
ServiceSubCategory.create(name: 'Cocktailmixer', serviceCategory: cat)
ServiceSubCategory.create(name: 'Barkeeper', serviceCategory: cat)