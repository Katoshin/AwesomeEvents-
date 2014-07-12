class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.integer :owner_id
      t.string :url,       null:false
      t.string :title
      t.string :thumbnail

      t.timestamps
    end

		add_index :musics, :owner_id
  end
end
