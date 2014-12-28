class MusicianMusicType < ActiveRecord::Base
  belongs_to :Musician
  belongs_to :MusicType
end
