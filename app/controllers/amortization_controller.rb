class AmortizationController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
