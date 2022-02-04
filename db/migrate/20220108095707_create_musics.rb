class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :artist_name
      t.string :song_name

      t.timestamps
    end
  end
end
