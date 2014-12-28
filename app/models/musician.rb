class Musician < ActiveRecord::Base

  enum musicianType: [ :Dj, :Band, :Soloist ]


  belongs_to :Service

  has_many :MusicType, through: :MusicianMusicType
end
