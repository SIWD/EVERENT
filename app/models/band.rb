class Band < ActiveRecord::Base
  belongs_to :Service
  belongs_to :category
end
