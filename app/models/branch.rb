class Branch < ActiveRecord::Base
  resourcify
  belongs_to :branchCategory
  has_many :services
end
