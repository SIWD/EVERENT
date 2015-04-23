class Contact < ActiveRecord::Base
  has_one :profile
  has_one :service
  has_one :business

  validates :mail, presence: true

end
