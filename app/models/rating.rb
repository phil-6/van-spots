class Rating < ApplicationRecord

  # model association
  belongs_to :spot
  belongs_to :user

  # validations
  validates_presence_of :user_id,
                        :spot_id,
                        :score
end
