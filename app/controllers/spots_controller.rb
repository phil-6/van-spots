class SpotsController < ApplicationController
  skip_before_action :authorize_request, only: [:index, :api_index]
  before_action :set_spot, only: [:show, :api_show,
                                  :update, :api_update,
                                  :destroy, :api_destroy]

  # Get /spots
  def index
    @spots = Spot.all
  end

  # GET /api/spots
  def api_index
    @spots = Spot.all
    json_response(@spots)
  end

  # GET /spots/:id
  def show
    @spot
  end

  # GET /api/spots/:id
  def api_show
    json_response(@spot)
  end



  # GET :userID/spots
  # def user_index
  #   # get current user todos
  #   @spots = current_user.spots
  #   json_response(@spots)
  # end


  # POST /spots
  def create
    @spot = current_user.spots.create!(spot_params)
    #TODO Add Response
  end

  # POST /api/spots
  def api_create
    @spot = current_user.spots.create!(spot_params)
    json_response(@spot, :created)
  end

  # PUT /spots/:id
  def update
    @spot.update(spot_params)
    #TODO Add Response
  end

  # PUT /api/spots/:id
  def api_update
    @spot.update(spot_params)
    json_response(@spot, :ok)
  end

  # DELETE /spots/:id
  def destroy
    @spot.destroy
    #TODO Add Response
  end

  # DELETE /api/spots/:id
  def api_destroy
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