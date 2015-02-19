class Business < ActiveRecord::Base
  resourcify
  has_many :user_businesses
  has_many :users, through: :user_businesses
  has_many :services
  has_many :event_businesses

  validates :name, uniqueness: true
end
