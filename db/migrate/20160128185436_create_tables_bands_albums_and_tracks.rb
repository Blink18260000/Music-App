class CreateTablesBandsAlbumsAndTracks < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :band_name, null: false

      t.timestamps
    end

    create_table :albums do |t|
      t.integer :band_id
      t.string :title, null: false
      t.boolean :live, default: false

      t.timestamps
    end

    create_table :tracks do |t|
      t.integer :album_id
      t.string :title, null: false
      t.boolean :bonus, default: false

      t.timestamps
    end

    add_index :bands, :band_name, unique: true
    add_index :albums, :title
    add_index :tracks, :title
  end
end
