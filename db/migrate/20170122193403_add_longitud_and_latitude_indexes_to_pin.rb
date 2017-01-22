class AddLongitudAndLatitudeIndexesToPin < ActiveRecord::Migration[5.0]
  def change

    add_index :pins, :latitude
    add_index :pins, :longitude
  end
end
