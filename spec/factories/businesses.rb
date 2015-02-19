FactoryGirl.define do
  factory :business do
    name        { Faker::Name.name }
    city        { Faker:Name.city }
    zipcode     { Faker::Name.zipcode }
    streetname  { Faker::Name.streetname }
    streetnumber{ Faker::Name.streetnumber }
  end

end
