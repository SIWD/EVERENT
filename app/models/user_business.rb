class UserBusiness < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :business

  enum position: [:Mitarbeiter, :Administrator]

  validates :user, :business, presence: true
end
