class RatingsController < ApplicationController
  before_action :set_spot, except: :ratings_index
  before_action :set_spot_rating, only: [:show, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]


  # GET /ratings # all ratings
  def ratings_index
    @ratings = Rating.all
    # puts(@ratings.to_json(:only => [:review_title]))
  end

  # GET /spots/:spot_id/ratings
  def index
    @spot.ratings
  end

  # GET /spots/:spot_id/ratings/:id
  def show
    @rating
  end

  # POST /spots/:spot_id/ratings
  def create
    @spot.ratings.create!(rating_params)
  end

  # GET /spots/:id/ratings/:id/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # PUT /spots/:spot_id/ratings/:id
  def update
    @rating.update(rating_params)
  end

  # DELETE /spots/:spot_id/ratings/:id
  def destroy
    @rating.destroy
  end

  private

  def require_permission
    if current_user != Rating.find(params[:id]).user
      redirect_to spot_path
    end
  end

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
