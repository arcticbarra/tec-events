class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.float :price
      t.string :slug, unique: true

      t.timestamps
    end
    add_index :events, :slug, unique: true
  end
end
