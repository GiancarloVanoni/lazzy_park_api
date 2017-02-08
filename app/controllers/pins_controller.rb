class PinsController < ApplicationController
   skip_before_action :verify_authenticity_token

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.closest_pins(pin_params_index)
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      render :show, status: :created, location: @pin
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.permit(:latitude, :longitude, :status)
    end

    def pin_params_index
      params.permit(:latitude, :longitude)
    end
end
