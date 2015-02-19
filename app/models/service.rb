class Service < ActiveRecord::Base
  belongs_to :business
  belongs_to :branch
  has_many :event_services

  validates :branch, :business, :name, presence: true
end
