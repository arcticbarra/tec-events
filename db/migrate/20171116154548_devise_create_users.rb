class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :major
      t.integer :semester

      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
