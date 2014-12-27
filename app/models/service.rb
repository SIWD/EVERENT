class Service < ActiveRecord::Base
  belongs_to :Business

  has_one :Dj
  has_one :Band
  #has_one :Soloist
  #has_one :Caering
end
