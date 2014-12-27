class Dj < ActiveRecord::Base
  belongs_to :Service
  belongs_to :Category
end
