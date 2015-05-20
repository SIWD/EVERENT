class Branch < ActiveRecord::Base
  resourcify
  belongs_to :branchCategory
  has_many :services

  validates :name, uniqueness: true
  validates :name, :branchCategory, presence: true
end
