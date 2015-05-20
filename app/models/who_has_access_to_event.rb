class WhoHasAccessToEvent < ActiveRecord::Base
  has_many :events
end
