class AddLongitudAndLatitudeToPin < ActiveRecord::Migration[5.0]
  def change

    add_column :pins, :latitude, :float, null: false, default: 0
    add_column :pins, :longitude, :float, null: false, default: 0
  end
end
