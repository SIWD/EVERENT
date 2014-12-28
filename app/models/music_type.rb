class MusicType < ActiveRecord::Base
  has_many :Musician, through: :MusicianMusicType
end
