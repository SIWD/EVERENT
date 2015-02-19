FactoryGirl.define do
  factory :service do
    name { FactoyGirl.Name.name }
    teaser { FactoryGirl.Name.teaser }
    description { FactoryGirl.Name.description }
  end

end
