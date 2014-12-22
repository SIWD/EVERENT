class Band < ActiveRecord::Base
  belongs_to :userService
  belongs_to :category
end
