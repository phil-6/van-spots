class Rating < ApplicationRecord
  # model association
  belongs_to :spot

  # validations
  validates_presence_of :score,
                        :review_title,
                        :review_body,
                        :spot_id

end
