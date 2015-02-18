class UserBusiness < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :business
end
