class CreateMusicTypes < ActiveRecord::Migration
  def change
    create_table :music_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
