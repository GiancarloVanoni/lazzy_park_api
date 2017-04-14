class ApiKey < ActiveRecord::Base
  before_create :set_access_token

  private

  def set_access_token
    self.access_token = generate_access_token
  end

  def generate_access_token
    begin
      access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
    access_token
  end

end
