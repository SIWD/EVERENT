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

Address.destroy_all
Business.destroy_all
Service.destroy_all
add1 = Address.create(city: 'Warendorf', zipcode: '48231', latitude: '51.9229261', longitude: '7.9674978', stateCode: 'NRW', country: 'DE', streetName: 'Gänsestraße', streetNumber: '6')
add2 = Address.create(city: 'Münster', zipcode: '48145', latitude: '51.96444', longitude: '7.6499', stateCode: 'NRW', country: 'DE', streetName: 'Warendorfer', streetNumber: '88')
bus1 = Business.create(name: 'Simply Impressive', address_id: add1.id)
bus2 = Business.create(name: 'Wittler', address_id: add2.id)
ser = Service.create(name: 'DJ CINO', teaser: 'House/Black/Charts', description: 'DJ CINO, fester Bestandteil des Münsteraner Nachtlebens. Mit seiner feinen Mischung aus Black’n’White & Best-Party-Ever beamt CINO die Party auf ein neuen Level hoch. Schließt euch Ihm an im Heaven Club, Soho, 4400 uvm.', business: bus1, branch: branch1)
ser = Service.create(name: 'DJ Pascal', teaser: 'Charts', description: 'Bekannt in Münster', business: bus2, branch: branch1)

user = User.new
user.id = 1
user.email = 'admin@admin.com'
user.password = '123456789'
user.password_confirmation = '123456789'
user.save!
user.add_role "admin"

WhoHasAccessToEvent.destroy_all
WhoHasAccessToEvent.create(id: 1, who: 'Jeder', icon: 'privacy/many_member.png')
WhoHasAccessToEvent.create(id: 2, who: 'Jeder mit Passwort', icon: 'privacy/many_member_lock.png')
WhoHasAccessToEvent.create(id: 3, who: 'Nur Gastgeber', icon: 'privacy/one_member.png')

EventUserStatus.destroy_all
EventUserStatus.create(status: 'owner')
EventUserStatus.create(status: 'moderator')
EventUserStatus.create(status: 'guest')

EventUserJoin.destroy_all
EventUserJoin.create(status: 'join')
EventUserJoin.create(status: 'maybe')
EventUserJoin.create(status: 'reject')
