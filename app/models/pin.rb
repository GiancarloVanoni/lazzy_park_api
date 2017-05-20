class Pin < ApplicationRecord

  STATUSES = { busy: 0, uncertain: 1, free: 2 }.with_indifferent_access
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

  after_commit  :delete_closest_pins, on: :create

  def status
    STATUSES.key(read_attribute(:status))
  end

  def status=(value)
    write_attribute(:status, STATUSES[value])
  end

  def self.closest_pins(coordinates)
    @pins = Pin.within(DISTANCE, origin: [coordinates[:latitude],
              coordinates[:longitude]])
    insecure_percent = Report.insecure_zone_percent(coordinates)
    @pins.map { |pin| pin.insecure_percent = insecure_percent }
    @pins
  end

  def self.update_statuses
    pins = Pin.all
    pins.each do |pin|
      # status's order here is important
      pin.status = "busy" if pin.status == "uncertain"
      pin.status = "uncertain" if pin.status == "free"
      pin.save!
    end
  end

  private

  def delete_closest_pins
    closest_pins = Pin.within(DELETE_DISTANCE, origin: [latitude, longitude])
    closest_pins.each do |pin|
      pin.delete unless pin == self
    end
  end

  def confirm_user_token
    users_api_client = UserApi.new(user_id, user_token)
    users_api_client.call
  end
end
