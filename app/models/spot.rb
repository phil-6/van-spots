# app/models/spot.rb
class Spot < ApplicationRecord

  # model associations
  has_many :ratings, dependent: :destroy, foreign_key: :spot_id

  # validations
  validates_presence_of :name,
                        :created_by,
                        :description,
                        :latitude,
                        :longitude
end
