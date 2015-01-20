# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BranchCategory.destroy_all
Branch.destroy_all
cat = BranchCategory.create(name: 'Musik')
Branch.create(name: 'DJ', branchCategory: cat)
Branch.create(name: 'Band', branchCategory: cat)
Branch.create(name: 'Solist', branchCategory: cat)


cat = BranchCategory.create(name: 'Essen')
Branch.create(name: 'Koch', branchCategory: cat)
Branch.create(name: 'Buffet-Caterer', branchCategory: cat)
Branch.create(name: 'Lieferservice', branchCategory: cat)


cat = BranchCategory.create(name: 'Transport')
Branch.create(name: 'Kutsche', branchCategory: cat)
Branch.create(name: 'Taxi', branchCategory: cat)
Branch.create(name: 'Limousinen Service', branchCategory: cat)
Branch.create(name: 'Bus', branchCategory: cat)


cat = BranchCategory.create(name: 'Dekorateur')
Branch.create(name: 'Florist', branchCategory: cat)


cat = BranchCategory.create(name: 'Trinken')
Branch.create(name: 'Cocktailmixer', branchCategory: cat)
Branch.create(name: 'Barkeeper', branchCategory: cat)

