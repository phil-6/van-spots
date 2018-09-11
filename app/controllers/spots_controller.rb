class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_spot, only: [:show, :update, :destroy]


  # Get /spots
  def index
    @spots = Spot.all
  end

  # GET /spots/:id
  def show
    @spot
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # POST /spots
  def create
    @spot = current_user.spots.create!(spot_params)
    #TODO Add Response
  end

  # GET /spots/:id/edit
  def edit
    @spot = Spot.find(params[:id])
  end

  # PUT /spots/:id
  def update
    # @spot.update(spot_params)
    #TODO Add Response

    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
      redirect_to @spot
    else
      render 'edit'
    end
  end

  # DELETE /spots/:id
  def destroy
    @spot.destroy
    #TODO Add Response
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
