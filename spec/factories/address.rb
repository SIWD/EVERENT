FactoryGirl.define do
  factory :address do
    city 'Teststadt'
    zipcode '12345'
    streetName 'Straßenname'
    streetNumber '26'
    business nil
  end

end
