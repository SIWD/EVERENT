admin = User.where(email: "admin@partychamp.de").first
unless admin.nil?
  unless admin.profile.nil?
    admin.profile.destroy
  end
  admin.destroy
end
admin = User.create!(email: "admin@partychamp.de", password: 'ibAvPChamp!', password_confirmation: 'ibAvPChamp!')
admin.add_role :admin
address = Address.create(city: "Steinhagen")
contact = Contact.create(mail: admin.email)
profile = Profile.create(gender: 0, firstname: "Admin", lastname: "Partychamp", user_id: admin.id, address_id: address.id, contact_id: contact.id)


BranchCategory.destroy_all
musik = BranchCategory.create!(id: 1, name: "Musik")
trans = BranchCategory.create!(id: 2, name: "Transport")
rent = BranchCategory.create!(id: 3, name: "Technik, Verleih & Dekoration")
gastr = BranchCategory.create!(id: 4, name: "Gastronomie")
orga = BranchCategory.create!(id: 5, name: "Organisation")
show = BranchCategory.create!(id: 6, name: "Showact & Unterhaltung")
foto = BranchCategory.create!(id: 7, name: "Foto & Video")
loc = BranchCategory.create!(id: 8, name: "Location")

Branch.destroy_all
Branch.create!([
                   {id: 1, name: "DJ", branchCategory_id: musik.id},
                   {id: 2, name: "Kutsche", branchCategory_id: trans.id},
                   {id: 3, name: "Koch", branchCategory_id: gastr.id},
                   {id: 4, name: "Eventplaner", branchCategory_id: orga.id},
                   {id: 5, name: "Feuerspucker", branchCategory_id: show.id},
                   {id: 6, name: "Zeltverleih", branchCategory_id: rent.id},
                   {id: 7, name: "Partyraum", branchCategory_id: loc.id},
                   {id: 8, name: "Hochzeitsrepotage", branchCategory_id: foto.id},
                   {id: 9, name: "Band", branchCategory_id: musik.id},
                   {id: 10, name: "Taxi", branchCategory_id: trans.id},
                   {id: 11, name: "Catering", branchCategory_id: gastr.id},
                   {id: 12, name: "Kinderbetreuung", branchCategory_id: orga.id},
                   {id: 13, name: "Zauberer", branchCategory_id: show.id},
                   {id: 14, name: "Veranstaltungstechnik", branchCategory_id: rent.id},
                   {id: 15, name: "Club", branchCategory_id: loc.id},
                   {id: 16, name: "Partyfotograf", branchCategory_id: foto.id},
                   {id: 17, name: "Solist", branchCategory_id: musik.id},
                   {id: 18, name: "Limousinen Service", branchCategory_id: trans.id},
                   {id: 19, name: "Cocktailmixer", branchCategory_id: gastr.id},
                   {id: 20, name: "Sicherheitsdienst", branchCategory_id: orga.id},
                   {id: 21, name: "Tänzer", branchCategory_id: show.id},
                   {id: 22, name: "Sanitäranlagen", branchCategory_id: rent.id},
                   {id: 23, name: "Bar", branchCategory_id: loc.id},
                   {id: 24, name: "Photobooth", branchCategory_id: foto.id},
                   {id: 25, name: "Busvermietung", branchCategory_id: trans.id},
                   {id: 26, name: "Konditor", branchCategory_id: gastr.id},
                   {id: 27, name: "Marketing", branchCategory_id: orga.id},
                   {id: 28, name: "Walking Act", branchCategory_id: show.id},
                   {id: 29, name: "Möbel", branchCategory_id: rent.id},
                   {id: 30, name: "Eventhalle", branchCategory_id: loc.id},
                   {id: 31, name: "Videograf", branchCategory_id: foto.id},
                   {id: 32, name: "Autovermietung", branchCategory_id: trans.id},
                   {id: 33, name: "Mobiler Imbiss", branchCategory_id: gastr.id},
                   {id: 34, name: "Stripper", branchCategory_id: show.id},
                   {id: 35, name: "Florist", branchCategory_id: rent.id},
                   {id: 36, name: "Oldtimer", branchCategory_id: trans.id},
                   {id: 37, name: "Barkeeper", branchCategory_id: gastr.id},
                   {id: 38, name: "Präsentationstechnik", branchCategory_id: rent.id},
                   {id: 39, name: "Servicepersonal", branchCategory_id: gastr.id},
                   {id: 40, name: "Pyrotechnik", branchCategory_id: show.id}
               ])

WhoHasAccessToEvent.destroy_all
WhoHasAccessToEvent.create!([
                                {id: 1, who: "Jeder", title: "Öffentlich", icon: "privacy/many_member.png"},
                                {id: 2, who: "Jeder mit Passwort", title: "Privat (Passwort)", icon: "privacy/many_member_lock.png"},
                                {id: 3, who: "Nur Gastgeber", title: "Gesperrt", icon: "privacy/one_member.png"}
                            ])

EventUserJoin.destroy_all
EventUserJoin.create!([
                          {id: 1, status: "join"},
                          {id: 2, status: "maybe"},
                          {id: 3, status: "reject"}
                      ])

EventUserStatus.destroy_all
EventUserStatus.create!([
                            {id: 1, status: "owner"},
                            {id: 2, status: "moderator"},
                            {id: 3, status: "guest"}
                        ])

EventGenre.destroy_all
EventGenre.create([
                      {id: 1, name: "Club"},
                      {id: 2, name: "Live Auftritt"},
                      {id: 3, name: "Studentenparty"},
                      {id: 4, name: "ABI-Party"},
                      {id: 5, name: "Zeltparty"},
                      {id: 6, name: "Scheunenball"},
                      {id: 7, name: "Mottoparty"},
                      {id: 8, name: "Sceneparty"},
                      {id: 9, name: "Festival"},
                      {id: 10, name: "Konzert"}
                  ])


case Rails.env
  when "development"

    User.create!([
                     {email: "michael@tork.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-02-22 17:00:50", last_sign_in_at: "2015-02-22 16:59:25", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "florian@woertler.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 16:48:59", last_sign_in_at: "2015-02-22 16:48:59", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "nico@buescher.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 16:51:18", last_sign_in_at: "2015-02-22 16:51:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "nils@schlauss.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 16:53:48", last_sign_in_at: "2015-02-22 16:53:48", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "helge@schneider.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-02-22 17:27:45", last_sign_in_at: "2015-02-22 17:01:48", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "frank@white.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-02-22 17:28:40", last_sign_in_at: "2015-02-22 17:01:22", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "dj@pascal.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 17:30:38", last_sign_in_at: "2015-02-22 17:30:38", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                     {email: "johnny@coffee.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 17:34:53", last_sign_in_at: "2015-02-22 17:34:53", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
                 ])

    Address.create!([
                        {city: "Ascheberg", postalCode: "59387", street1: "Sandstraße 12", street2: "", latitude: 51.7915084, longitude: 7.6180707, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48149", street1: "Corrensstraße 25", street2: "", latitude: 51.96850000000001, longitude: 7.59537, stateCode: nil, country: nil},
                        {city: "Warendorf", postalCode: "48231", street1: "Gänsestraße 6", street2: "", latitude: 51.9229261, longitude: 7.9674978, stateCode: nil, country: nil},
                        {city: "München", postalCode: "80331", street1: "Marienplatz 8", street2: "", latitude: 48.137327, longitude: 11.576052, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48145", street1: "Warendorferstraße 88", street2: "", latitude: 51.96444, longitude: 7.649900000000001, stateCode: nil, country: nil},
                        {city: "Ascheberg", postalCode: "59387", street1: "Mühlenkamp 2", street2: "", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48155", street1: "Albersloher Weg 14", street2: "", latitude: 51.94991, longitude: 7.636969999999999, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48155", street1: "Albersloher Weg 16", street2: "", latitude: 51.95019689999999, longitude: 7.637523600000001, stateCode: nil, country: nil},
                        {city: "Ascheberg", postalCode: "59387", street1: " Mühlenkamp 2", street2: "", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil},
                        {city: "/", postalCode: "12345", street1: "/", street2: "", latitude: "/", longitude: "/", stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48155", street1: "Albersloher Weg 14", street2: "", latitude: 51.94991, longitude: 7.636969999999999, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48155", street1: "Albersloher Weg 16", street2: "", latitude: 51.95019689999999, longitude: 7.637523600000001, stateCode: nil, country: nil},
                        {city: "Ascheberg", postalCode: "59387", street1: " Mühlenkamp 2", street2: "", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil},
                        {city: "Ascheberg", postalCode: "59387", street1: "Mühlenkamp 2", street2: "", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48155", street1: "Albersloher Weg 14", street2: "", latitude: 51.94991, longitude: 7.636969999999999, stateCode: nil, country: nil},
                        {city: "Münster", postalCode: "48155", street1: "Albersloher Weg 16", street2: "", latitude: 51.95019689999999, longitude: 7.637523600000001, stateCode: nil, country: nil},
                        {city: "Ascheberg", postalCode: "59387", street1: " Mühlenkamp 2", street2: "", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil},
                        {city: "Ascheberg", postalCode: "59387", street1: " Mühlenkamp 2", street2: "", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil}
                    ])

    Contact.create!([
                        {mail: "a@a.de", phone: "/"},
                        {mail: "b@b.de", phone: "1434657"},
                        {mail: "c@c.de", phone: "8765432"},
                        {mail: "d@d.de", phone: "2332694"},
                        {mail: "e@e.de", phone: "01038757"},
                        {mail: "f@f.de", phone: "2894762"},
                        {mail: "g@g.de", phone: "01029385"},
                        {mail: "h@h.de", phone: "01029384"},
                        {mail: "i@i.de", phone: "12348673"},
                        {mail: "j@j.de", phone: "2345654"},
                        {mail: "k@k.de", phone: "987654"},
                        {mail: "l@l.de", phone: "234433"},
                        {mail: "m@m.de", phone: "1212121212"},
                        {mail: "n@n.de", phone: "88383883"}
                    ])

    Profile.create!([
                        {gender: 0, firstname: "Michael", lastname: "Tork", user_id: 2, photo_file_name: "1.png", photo_content_type: "image/png", photo_file_size: 10305, photo_updated_at: "2015-02-24 13:08:44", address_id: 11, contact_id: 2},
                        {gender: 0, firstname: "Florian", lastname: "Wörtler", user_id: 3, photo_file_name: "2.jpg", photo_content_type: "image/jpeg", photo_file_size: 27308, photo_updated_at: "2015-02-24 13:19:47", address_id: 12, contact_id: 3},
                        {gender: 0, firstname: "Nico", lastname: "Büscher", user_id: 4, photo_file_name: "medium.jpg", photo_content_type: "image/jpeg", photo_file_size: 18373, photo_updated_at: "2015-02-24 13:21:26", address_id: 13, contact_id: 4},
                        {gender: 0, firstname: "Nils", lastname: "Schlauss", user_id: 5, photo_file_name: "3.jpg", photo_content_type: "image/jpeg", photo_file_size: 23013, photo_updated_at: "2015-02-24 13:20:19", address_id: 14, contact_id: 5},
                        {gender: 0, firstname: "Helge", lastname: "Schneider", user_id: 6, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: 15, contact_id: 6},
                        {gender: 0, firstname: "Frank", lastname: "White", user_id: 7, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: 16, contact_id: 7},
                        {gender: 0, firstname: "Pascal", lastname: "Möller", user_id: 8, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: 17, contact_id: 8},
                        {gender: 0, firstname: "Johannes", lastname: "Kraut", user_id: 9, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: 18, contact_id: 9}
                    ])

    Business.create!([
                         {name: "Firma Tork", address_id: 1, contact_id: 10},
                         {name: "Firma Wörtler", address_id: 2, contact_id: 11},
                         {name: "Simply Impressive", address_id: 3, contact_id: 12},
                         {name: "Schlauss & Co", address_id: 4, contact_id: 13},
                         {name: "Pascalo", address_id: 5, contact_id: 14}
                     ])

    EventLocation.create!([
                              {name: "Club Soho Münster", address_id: 8},
                              {name: "Bei mir Zuhause!", address_id: 9}
                          ])

    EventProfile.create!([
                             {event_id: 1, profile_id: 2, event_user_status_id: 1, event_user_join_id: 1},
                             {event_id: 2, profile_id: 9, event_user_status_id: 1, event_user_join_id: 1}
                         ])

    Role.create!([
                     {name: "global_admin", resource_id: nil, resource_type: nil},
                     {name: "business_admin", resource_id: 1, resource_type: "Business"},
                     {name: "business_admin", resource_id: 2, resource_type: "Business"},
                     {name: "business_admin", resource_id: 3, resource_type: "Business"},
                     {name: "business_admin", resource_id: 4, resource_type: "Business"},
                     {name: "business_admin", resource_id: 5, resource_type: "Business"},
                     {name: "eventOwner", resource_id: 1, resource_type: "Event"},
                     {name: "eventOwner", resource_id: 2, resource_type: "Event"}
                 ])

    Role::HABTM_Users.create!([
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 8, role_id: 6},
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 8, role_id: 6},
                                  {user_id: 2, role_id: 7},
                                  {user_id: 9, role_id: 8}
                              ])

    User::HABTM_Roles.create!([
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 8, role_id: 6},
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 1, role_id: 1},
                                  {user_id: 2, role_id: 2},
                                  {user_id: 3, role_id: 3},
                                  {user_id: 4, role_id: 4},
                                  {user_id: 5, role_id: 5},
                                  {user_id: 7, role_id: 2},
                                  {user_id: 8, role_id: 6},
                                  {user_id: 2, role_id: 7},
                                  {user_id: 9, role_id: 8}
                              ])

    Service.create!([
                        {name: "Buffet-Tork", teaser: "Lecker Buffet-Caterer", description: "Super Lecker Buffet-Caterer", business_id: 1, branch_id: 5, sameAddressLikeBusiness: 1, sameContactLikeBusiness: 1},
                        {name: "Taxi-Wörtler", teaser: "Taxi-Dienst ", description: "Taxi-Dienst Wörtler", business_id: 2, branch_id: 8, sameAddressLikeBusiness: 1, sameContactLikeBusiness: 1},
                        {name: "DJ CINO", teaser: "House/Black/Charts", description: "DJ CINO, fester Bestandteil des Münsteraner Nachtlebens. Mit seiner feinen Mischung aus Black’n’White & Best-Party-Ever beamt CINO die Party auf ein neuen Level hoch. Schließt euch Ihm an im Heaven Club, Soho, 4400 uvm.", business_id: 3, branch_id: 1, sameAddressLikeBusiness: 1, sameContactLikeBusiness: 1},
                        {name: "Taxi-Schlauss", teaser: "Speed Taxi", description: "Super Taxi-Dienst von Schlauss", business_id: 4, branch_id: 8, sameAddressLikeBusiness: 1, sameContactLikeBusiness: 1},
                        {name: "DJ Pascal", teaser: "Charts", description: "DJ Pascal - Bekannt in Münster und Umgebung.", business_id: 5, branch_id: 1, sameAddressLikeBusiness: 1, sameContactLikeBusiness: 1}
                    ])

    UserBusiness.create!([
                             {position: 1, business_id: 1, user_id: 2},
                             {position: 1, business_id: 2, user_id: 3},
                             {position: 1, business_id: 3, user_id: 4},
                             {position: 1, business_id: 4, user_id: 5},
                             {position: 0, business_id: 1, user_id: 6},
                             {position: 1, business_id: 1, user_id: 7},
                             {position: 1, business_id: 5, user_id: 8}
                         ])


    Event.create!([
                      {name: "Flashmob Soho", description: "Jeder der will darf kommen, bis der Laden voll ist :D", date: "2015-10-04", time: "2000-01-01 20:00:00", event_location_id: 1, who_has_access_id: 1, password: ""},
                      {name: "Geburtstag von Kraut", description: "Ich werde mal wieder ein jahr älter :) Für Getränke und andere, nicht legale, Substanzen ist gesorgt ...", date: "2015-08-08", time: "2000-01-01 19:00:00", event_location_id: 2, who_has_access_id: 2, password: "123456789"}
                  ])


    EventEventGenre.create([
                               {event_id: 1, event_genre_id: 4},
                               {event_id: 2, event_genre_id: 1}
                           ])
  when "production"

end