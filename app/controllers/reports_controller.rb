class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      render :show, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.permit(:latitude, :longitude, :report_type, :description, :user_id, :user_token)
  end
end
