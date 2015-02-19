class Service < ActiveRecord::Base
  belongs_to :business
  belongs_to :branch

  validates :branch, :business, :name, presence: true
end
