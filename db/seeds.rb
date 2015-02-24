User.create!([
                 {email: "admin@admin.com", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-02-22 17:28:13", last_sign_in_at: "2015-02-22 16:43:47", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "michael@tork.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-02-22 17:00:50", last_sign_in_at: "2015-02-22 16:59:25", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "florian@woertler.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 16:48:59", last_sign_in_at: "2015-02-22 16:48:59", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "nico@buescher.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 16:51:18", last_sign_in_at: "2015-02-22 16:51:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "nils@schlauss.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 16:53:48", last_sign_in_at: "2015-02-22 16:53:48", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "helge@schneider.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-02-22 17:27:45", last_sign_in_at: "2015-02-22 17:01:48", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "frank@white.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-02-22 17:28:40", last_sign_in_at: "2015-02-22 17:01:22", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "dj@pascal.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 17:30:38", last_sign_in_at: "2015-02-22 17:30:38", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "johnny@coffee.de", password: '123456789', password_confirmation: '123456789', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 17:34:53", last_sign_in_at: "2015-02-22 17:34:53", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
             ])

BranchCategory.create!([
                           {name: "Musik"},
                           {name: "Essen"},
                           {name: "Transport"},
                           {name: "Dekorateur"},
                           {name: "Trinken"}
                       ])

Branch.create!([
                   {name: "DJ", branchCategory_id: 1},
                   {name: "Band", branchCategory_id: 1},
                   {name: "Solist", branchCategory_id: 1},
                   {name: "Koch", branchCategory_id: 2},
                   {name: "Buffet-Caterer", branchCategory_id: 2},
                   {name: "Lieferservice", branchCategory_id: 2},
                   {name: "Kutsche", branchCategory_id: 3},
                   {name: "Taxi", branchCategory_id: 3},
                   {name: "Limousinen Service", branchCategory_id: 3},
                   {name: "Bus", branchCategory_id: 3},
                   {name: "Florist", branchCategory_id: 4},
                   {name: "Cocktailmixer", branchCategory_id: 5},
                   {name: "Barkeeper", branchCategory_id: 5}
               ])

Address.create!([
                    {city: "Ascheberg", zipcode: "59387", streetName: "Sandstraße", streetNumber: "12", latitude: 51.7915084, longitude: 7.6180707, stateCode: nil, country: nil},
                    {city: "Münster", zipcode: "48149", streetName: "Corrensstraße", streetNumber: "25", latitude: 51.96850000000001, longitude: 7.59537, stateCode: nil, country: nil},
                    {city: "Warendorf", zipcode: "48231", streetName: "Gänsestraße", streetNumber: "6", latitude: 51.9229261, longitude: 7.9674978, stateCode: nil, country: nil},
                    {city: "München", zipcode: "80331", streetName: "Marienplatz", streetNumber: "8", latitude: 48.137327, longitude: 11.576052, stateCode: nil, country: nil},
                    {city: "Münster", zipcode: "48145", streetName: "Warendorferstraße", streetNumber: "88", latitude: 51.96444, longitude: 7.649900000000001, stateCode: nil, country: nil},
                    {city: "Ascheberg", zipcode: "59387", streetName: "Mühlenlamp", streetNumber: "2", latitude: 51.7856499, longitude: 7.61848, stateCode: nil, country: nil},
                    {city: "Münster", zipcode: "48155", streetName: "Albersloher Weg", streetNumber: "14", latitude: 51.94991, longitude: 7.636969999999999, stateCode: nil, country: nil}
                ])

Business.create!([
                     {name: "Firma Tork", address_id: 1},
                     {name: "Firma Wörtler", address_id: 2},
                     {name: "Simply Impressive", address_id: 3},
                     {name: "Schlauss & Co", address_id: 4},
                     {name: "Pascalo", address_id: 5}
                 ])

Role.create!([
                 {name: "global_admin", resource_id: nil, resource_type: nil},
                 {name: "business_admin", resource_id: 1, resource_type: "Business"},
                 {name: "business_admin", resource_id: 2, resource_type: "Business"},
                 {name: "business_admin", resource_id: 3, resource_type: "Business"},
                 {name: "business_admin", resource_id: 4, resource_type: "Business"},
                 {name: "business_admin", resource_id: 5, resource_type: "Business"}
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
                              {user_id: 8, role_id: 6}
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
                              {user_id: 8, role_id: 6}
                          ])

Event.create!([
                  {name: "Geburtstag", description: "Bringt gute Stimmung mit :)", date: "2015-05-09", time: "2000-01-01 22:35:00", event_location_id: 1, who_has_access_id: 1, password: ""},
                  {name: "Hochzeit", description: "Gefangen in der Ehe :)", date: "2015-08-22", time: "2000-01-01 13:00:00", event_location_id: 2, who_has_access_id: 2, password: "123456789"}
              ])

EventLocation.create!([
                          {name: "Bei mir Zuhasuse!", address_id: 6},
                          {name: "Club Veron", address_id: 7}
                      ])

EventUser.create!([
                      {event_id: 1, user_id: 9, event_user_status_id: 1, event_user_join_id: 1},
                      {event_id: 2, user_id: 9, event_user_status_id: 1, event_user_join_id: 1}
                  ])

EventUserJoin.create!([
                          {status: "join"},
                          {status: "maybe"},
                          {status: "reject"}
                      ])

EventUserStatus.create!([
                            {status: "owner"},
                            {status: "moderator"},
                            {status: "guest"}
])

Profile.create!([
                    {gender: 0, firstname: "/", lastname: "Administrator", phone: "/", city: "/", postcode: "/", streetname: "/", housenumber: "/", user_id: 1, photo_file_name: "admin.jpg", photo_content_type: "image/jpeg", photo_file_size: 700437, photo_updated_at: "2015-02-24 13:18:18", address_id: nil},
                    {gender: 0, firstname: "Michael", lastname: "Tork", phone: "01234567", city: "Ascheberg", postcode: "59387", streetname: "Sandstraße", housenumber: "12", user_id: 2, photo_file_name: "1.png", photo_content_type: "image/png", photo_file_size: 10305, photo_updated_at: "2015-02-24 13:08:44", address_id: nil},
                    {gender: 0, firstname: "Florian", lastname: "Wörtler", phone: "01234566", city: "Münster", postcode: "48149", streetname: "Corrensstraße", housenumber: "25", user_id: 3, photo_file_name: "2.jpg", photo_content_type: "image/jpeg", photo_file_size: 27308, photo_updated_at: "2015-02-24 13:19:47", address_id: nil},
                    {gender: 0, firstname: "Nico", lastname: "Büscher", phone: "01234565", city: "Warendorf", postcode: "48231", streetname: "Gänsestraße", housenumber: "6", user_id: 4, photo_file_name: "medium.jpg", photo_content_type: "image/jpeg", photo_file_size: 18373, photo_updated_at: "2015-02-24 13:21:26", address_id: nil},
                    {gender: 0, firstname: "Nils", lastname: "Schlauss", phone: "01231234", city: "München", postcode: "80331", streetname: "Marienplatz", housenumber: "8", user_id: 5, photo_file_name: "3.jpg", photo_content_type: "image/jpeg", photo_file_size: 23013, photo_updated_at: "2015-02-24 13:20:19", address_id: nil},
                    {gender: 0, firstname: "Helge", lastname: "Schneider", phone: "07654321", city: "Berlin", postcode: "11011", streetname: "Platz der Republik", housenumber: "1", user_id: 6, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: nil},
                    {gender: 0, firstname: "Frank", lastname: "White", phone: "07452136", city: "Ascheberg", postcode: "59387", streetname: "Dorfheide", housenumber: "41", user_id: 7, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: nil},
                    {gender: 0, firstname: "Pascal", lastname: "Möller", phone: "01222222", city: "Münster", postcode: "48145", streetname: "Warendorferstraße", housenumber: "88", user_id: 8, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: nil},
                    {gender: 0, firstname: "Johannes", lastname: "Kraut", phone: "012333345", city: "Ascheberg", postcode: "59387", streetname: "Mühlenkamp", housenumber: "2", user_id: 9, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil, address_id: nil}
                ])

Service.create!([
                    {name: "Buffet-Tork", teaser: "Lecker Buffet-Caterer", description: "Super Lecker Buffet-Caterer",email: "info@tork.de", phone: "01111111", business_id: 1, branch_id: 5},
                    {name: "Taxi-Wörtler", teaser: "Taxi-Dienst ", description: "Taxi-Dienst Wörtler", email: "info@woertler.de", phone: "01111112", business_id: 2, branch_id: 8},
                    {name: "DJ CINO", teaser: "House/Black/Charts", description: "DJ CINO, fester Bestandteil des Münsteraner Nachtlebens. Mit seiner feinen Mischung aus Black’n’White & Best-Party-Ever beamt CINO die Party auf ein neuen Level hoch. Schließt euch Ihm an im Heaven Club, Soho, 4400 uvm.", email: "info@cino.de", phone: "01111113", business_id: 3, branch_id: 1},
                    {name: "Taxi-Schlauss", teaser: "Speed Taxi", description: "Super Taxi-Dienst von Schlauss", email: "info@schlauss.de", phone: "01111114", business_id: 4, branch_id: 8},
                    {name: "DJ Pascal", teaser: "Charts", description: "DJ Pascal - Bekannt in Münster und Umgebung.", email: "info@pascal.de", phone: "01111115", business_id: 5, branch_id: 1}
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

WhoHasAccessToEvent.create!([
                                {who: "Jeder", icon: "privacy/many_member.png"},
                                {who: "Jeder mit Passwort", icon: "privacy/many_member_lock.png"},
                                {who: "Nur Gastgeber", icon: "privacy/one_member.png"}
                            ])
