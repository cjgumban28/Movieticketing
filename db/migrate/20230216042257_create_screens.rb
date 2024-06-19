class CreateScreens < ActiveRecord::Migration[7.0]
  def change
    create_table :screens do |t|
      t.integer :screen_id

      t.references :theatre, null:false , foreign_key: true

      t.timestamps
    end
  end
end
