class AddLongitudeAndLatitudeToReports < ActiveRecord::Migration[5.0]
  def change

    add_column :reports, :latitude, :float, null: false, default: 0
    add_column :reports, :longitude, :float, null: false, default: 0

  end
end
