class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :api_index]
  before_action :set_spot, only: [:show, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]

  # GET /spots
  def index
    @spots = Spot.all
  end

  # GET /api/spots
  def api_index
    @spots = Spot.all
    render json: @spots
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
    if @spot = current_user.spots.create!(spot_params)
      redirect_to @spot
    else
      render 'new'
    end
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

  def require_permission
    if current_user != Spot.find(params[:id]).user
      redirect_to spot_path
    end
  end

  def spot_params
    # whitelist params
    params.require(:spot).permit(:name, :spot_type, :description, :latitude, :longitude, :web_link)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

end
