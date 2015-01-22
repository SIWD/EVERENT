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
branch1 = Branch.create(name: 'DJ', branchCategory: cat)
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


add1 = Address.create(city: 'Warendorf', zipcode: '48231', lat: '51.9229261', lng: '7.9674978', stateCode: 'NRW', country: 'DE', streetName: 'Gänsestraße', streetNumber: '6')
add2 = Address.create(city: 'Münster', zipcode: '48145', lat: '51.96444', lng: '7.6499', stateCode: 'NRW', country: 'DE', streetName: 'Warendorfer', streetNumber: '88')
bus1 = Business.create(name: 'Simply Impressive', address_id: add1.id)
bus2 = Business.create(name: 'Wittler', address_id: add2.id)
ser = Service.create(name: 'DJ CINO', teaser: 'House/Black/Charts', description: 'DJ CINO, fester Bestandteil des Münsteraner Nachtlebens. Mit seiner feinen Mischung aus Black’n’White & Best-Party-Ever beamt CINO die Party auf ein neuen Level hoch. Schließt euch Ihm an im Heaven Club, Soho, 4400 uvm.', business: bus1, branch: branch1)
ser = Service.create(name: 'DJ Pascal', teaser: 'Charts', description: 'Bekannt in Münster', business: bus2, branch: branch1)
