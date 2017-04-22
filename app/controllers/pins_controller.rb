class PinsController < ApplicationController
   skip_before_action :verify_authenticity_token
   before_action      :set_pin, only: :update

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

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    if @pin.update(pin_params_update)
      render :show, status: :ok, location: @pin
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  private

  def set_pin
    @pin = Pin.find(params[:id])
  end

  def pin_params
    params.permit(:latitude, :longitude, :status)
  end

  def pin_params_index
    params.permit(:latitude, :longitude)
  end

  def pin_params_update
    params.permit(:status)
  end
end
