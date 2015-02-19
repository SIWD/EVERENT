FactoryGirl.define do
  factory :profile do
    gender      { Faker::Internet.gender }
    firstname   { Faker::Internet.firstname}
    lastname    { Faker::Internet.lastname }
    phone       { Faker::Internet.phone }
    city        { Faker::Internet.city }
    postcode    { Faker::Internet.postcode }
    streetname  { Faker::Internet.streetname }
    housenumber { Faker::Internet.housenumber }
  end
end
