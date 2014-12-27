class Profil < ActiveRecord::Base
  belongs_to :user, primary_key: "id", foreign_key: "user_id"
  validate :user_id, presence: true
end
