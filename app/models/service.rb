class Service < ActiveRecord::Base
  belongs_to :Business

  has_one :Food
  has_one :Musician
end
