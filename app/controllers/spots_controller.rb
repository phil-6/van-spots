class SpotsController < ApplicationController
  skip_before_action :authorize_request, only: :index
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = Spot.all
    json_response(@spots)
  end

  # GET :userID/spots
  # def user_index
  #   # get current user todos
  #   @spots = current_user.spots
  #   json_response(@spots)
  # end

  # GET /spots/:id
  def show
    json_response(@spot)
  end

  # POST /spots
  def create
    #puts ("I'm here")
    #puts (spot_params)
    @spot = current_user.spots.create!(spot_params)
    json_response(@spot, :created)
  end

  # PUT /spots/:id
  def update
    @spot.update(spot_params)
    json_response(@spot, :ok)
  end

  # DELETE /spots/:id
  def destroy
    @spot.destroy
    head :no_content
  end

  private

  def spot_params
    # whitelist params
    params.permit(:name, :description, :latitude, :longitude)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end