class Profil < ActiveRecord::Base
  belongs_to :user

  validate :user_id, presence: true
end
