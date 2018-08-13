# app/controllers/ratings_controller.rb
class RatingsController < ApplicationController
  before_action :set_spot, except: [:ratings_index, :api_ratings_index]
  before_action :set_spot_rating, only: [:show, :api_show,
                                         :update, :api_update,
                                         :destroy, :api_destroy]

  # GET /ratings # all ratings
  def ratings_index
    @ratings = Rating.all
    # puts(@ratings.to_json(:only => [:review_title]))
  end

  # GET /api/ratings # all ratings
  def api_ratings_index
    @ratings = Rating.all
    # puts(@ratings.to_json(:only => [:review_title]))
    json_response(@ratings)
  end


  # GET /spots/:spot_id/ratings
  def index
    @spot.ratings
  end

  # GET /api/spots/:spot_id/ratings
  def api_index
    json_response(@spot.ratings)
  end

  # GET /spots/:spot_id/ratings/:id
  def show
    @rating
  end

  # GET /api/spots/:spot_id/ratings/:id
  def api_show
    json_response(@rating)
  end

  # POST /spots/:spot_id/ratings
  def create
    @spot.ratings.create!(rating_params)
  end

  # POST /api/spots/:spot_id/ratings
  def api_create
    @spot.ratings.create!(rating_params)
    json_response(@rating, :created)
  end

  # PUT /spots/:spot_id/ratings/:id
  def update
    @rating.update(rating_params)
  end

  # PUT /api/spots/:spot_id/ratings/:id
  def api_update
    @rating.update(rating_params)
    json_response(@rating, :ok)
  end

  # DELETE /spots/:spot_id/ratings/:id
  def destroy
    @rating.destroy
  end

  # DELETE /api/spots/:spot_id/ratings/:id
  def api_destroy
    @rating.destroy
    head :no_content
  end

  private

  def rating_params
    params.permit(:score, :created_by, :review_title, :review_body)
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def set_spot_rating
    @rating = @spot.ratings.find_by!(id: params[:id]) if @spot
  end
end