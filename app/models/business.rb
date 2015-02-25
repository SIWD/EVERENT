class Business < ActiveRecord::Base
  resourcify
  has_many :user_businesses
  has_many :users, through: :user_businesses
  has_many :services
  has_many :event_businesses
  has_many :events, through: :event_businesses
  belongs_to :address


  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  validates :address_id, presence: true
end
