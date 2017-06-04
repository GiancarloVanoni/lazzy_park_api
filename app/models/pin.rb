class Pin < ApplicationRecord
  # busy:           a driver is using the spot (state 1 in the life cycle of a pin)
  # free:           a driver left the spot free max 4 mins ago (state 2 in the life cycle of a pin)
  # low_uncertain:  a driver left the spot free between 8 mins and 4 ago (state 3 in the life cycle of a pin)
  # high_uncertain: a driver left the spot free between 12 mins and 8 ago (state 4 in the life cycle of a pin)
  STATUSES = { busy: 0, free: 1, low_uncertain: 2, high_uncertain: 3 }.with_indifferent_access
  DISTANCE = 200
  DELETE_DISTANCE = 2.5

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  validates :status, presence: true,
                     inclusion: { in: STATUSES.stringify_keys.keys }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validate  :confirm_user_token

  attr_accessor :user_token
  attr_accessor :insecure_percent

  scope :active, -> { where deleted: false }
  scope :with_busy_status, -> { where status: 'busy' }

  after_commit  :delete_closest_pins, on: :create

  def status
    STATUSES.key(read_attribute(:status))
  end

  def status=(value)
    write_attribute(:status, STATUSES[value])
  end

  def self.closest_pins(coordinates)
    pins = Pin.active.within(DISTANCE, origin: [coordinates[:latitude],
               coordinates[:longitude]])
    add_insecure_percent(pins, coordinates)
  end

  def self.update_statuses
    pins = Pin.active
    pins.each do |pin|
      # status's order here is important
      if time_condition(pin)
        pin.deleted = true if pin.status == 'high_uncertain'
        pin.status  = 'high_uncertain' if pin.status == 'low_uncertain'
        pin.status  = 'low_uncertain' if pin.status == "free"
        pin.save!
      end
    end
  end

  private

  def delete_closest_pins
    closest_pins = Pin.active.within(DELETE_DISTANCE, origin: [latitude, longitude])
    closest_pins.each do |pin|
      pin.deleted = true unless pin == self
    end
  end

  def self.add_insecure_percent(pins, coordinates)
    insecure_percent = Report.insecure_zone_percent(coordinates)
    pins.map { |pin| pin.insecure_percent = insecure_percent }
    pins
  end

  def confirm_user_token
    users_api_client = UserApi.new(user_id, user_token)
    unless users_api_client.call
      errors.add(:base, 'User token is invalid.')
    end
  end

  def self.time_condition(pin)
    pin.updated_at < Time.current - 4.minutes
  end
end
