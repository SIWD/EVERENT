FactoryGirl.define do
  factory :profile do
    gender "MyString"
    firstname "MyString"
    lastname "MyString"
    phone "MyString"
    city "MyString"
    postcode "MyString"
    streetname "MyString"
    housenumber "MyString"

    user nil
  end
end
