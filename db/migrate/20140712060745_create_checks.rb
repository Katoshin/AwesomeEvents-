class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.references :user
      t.references :music, null: false
      t.string :comment

      t.timestamps
    end
  

	add_index :checks, [:user_id, :music_id], unique: true
	add_index :checks, [:music_id, :user_id], unique: true

	end
end
