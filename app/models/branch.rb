class Branch < ActiveRecord::Base
  belongs_to :branchCategory
  has_many :services
end
