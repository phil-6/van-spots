require 'rails_helper'

RSpec.describe Rating, type: :model do
  # Association test
  # ensure a review record belongs to a single spot record
  it { should belong_to(:spot) }

  # Validation test
  # ensure columns are present before saving
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:review_title) }
  it { should validate_presence_of(:review_body) }
  it { should validate_presence_of(:spot_id) }
end
