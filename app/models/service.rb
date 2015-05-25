class Service < ActiveRecord::Base
  belongs_to :business
  belongs_to :branch
  has_many :event_services
  has_many :events, through: :event_services
  belongs_to :address
  belongs_to :contact

  validates :branch, :business, :name, presence: true


  before_validation do

    if self.sameContactLikeBusiness
      self.contact = self.business.contact
    end

    if self.sameAddressLikeBusiness
      self.address = self.business.address
    end
  end

end
