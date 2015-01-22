class Address < ActiveRecord::Base
  has_one :profile
  has_one :business
end
