class Service < ActiveRecord::Base
  belongs_to :business
  belongs_to :service_sub_category
  has_one :Food
  has_one :Musician
end
