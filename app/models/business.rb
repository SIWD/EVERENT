class Business < ActiveRecord::Base
  has_many :User, through: :UserBusiness
  has_many :Service
end
