class Report < ApplicationRecord

  INSECURE_DISTANCE = 200

  REPORT_TYPES = [
    'broken_street', 'insecure_zone', 'velocity_camera',
    'transit_police'
  ]

  validates :report_type, presence: true,
                          inclusion: { in: REPORT_TYPES }
  validates :latitude,    presence: true
  validates :longitude,   presence: true

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  def self.insecure_zone_percent(coordinates)
    insecure_reports = Report.within(INSECURE_DISTANCE, origin: [coordinates[:latitude],
                         coordinates[:longitude]]).where(report_type: 'insecure_zone')
    calculate_insecure_percent(insecure_reports)
  end

  private

  def self.calculate_insecure_percent(insecure_reports)
    percent = insecure_reports.count * 10
    percent > 100 ? 100 : percent
  end
end
