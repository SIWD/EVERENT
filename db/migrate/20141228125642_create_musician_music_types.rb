class CreateMusicianMusicTypes < ActiveRecord::Migration
  def change
    create_table :musician_music_types do |t|

      t.timestamps
    end
  end
end
