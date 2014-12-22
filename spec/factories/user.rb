FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'Helge123'
    password_confirmation 'Helge123'
  end
end