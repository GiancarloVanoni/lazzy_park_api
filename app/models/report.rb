class Report < ApplicationRecord

  STATUSES = [
    'broken_street', 'thiefs', 'velocity_camera',
    'traffic_jam', 'transit_police'
  ]

  validates :type,      presence: true,
                        inclusion: { in: STATUSES }

  validates :latitude,  presence: true
  validates :longitude, presence: true

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

end
