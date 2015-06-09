class Service < ActiveRecord::Base
  belongs_to :business
  belongs_to :branch
  has_many :event_services
  has_many :events, through: :event_services
  belongs_to :address
  belongs_to :contact

  validates :branch, :business_id, :name, presence: true
  validates :address, :contact, :name, presence: true



end
