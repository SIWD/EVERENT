class UserBusiness < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  enum position: [:Mitarbeiter, :Administrator]

  validates :user, :business, presence: true
end
