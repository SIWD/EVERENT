class Service < ActiveRecord::Base
  belongs_to :business
  belongs_to :branch
  has_many :event_services
  belongs_to :address
  belongs_to :contact

  validates :branch, :business, :name, presence: true

  # validates_format_of :email, :with => /@/


  def contact
    if self.sameContactLikeBusiness
      self.business.contact
    else
      self.contact
    end
  end

  def address
    if self.sameAddressLikeBusiness
      self.business.address
    else
      self.address
    end
  end

end
