class Pin < ApplicationRecord

  STATUSES = { busy: 0, uncertain: 1, free: 2 }.with_indifferent_access
  DISTANCE = 200

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  validates :status, presence: true,
                     inclusion: { in: STATUSES.stringify_keys.keys }
  validates :latitude, presence: true
  validates :longitude, presence: true

  def status
    STATUSES.key(read_attribute(:status))
  end

  def status=(value)
    write_attribute(:status, STATUSES[value])
  end

  def self.closest_pins(coordinates)
    Pin.within(DISTANCE, origin: [coordinates[:latitude],
      coordinates[:longitude]])
  end
end
