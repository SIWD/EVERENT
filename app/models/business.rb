class Business < ActiveRecord::Base
  has_many :user_businesses
  has_many :users, through: :user_businesses
  has_many :services

  validates :name, uniqueness: true
end
