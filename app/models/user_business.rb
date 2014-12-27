class UserBusiness < ActiveRecord::Base
  belongs_to :User
  belongs_to :Business
end
