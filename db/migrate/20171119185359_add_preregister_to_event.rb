class AddPreregisterToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :pre_register, :boolean, default: true
  end
end
