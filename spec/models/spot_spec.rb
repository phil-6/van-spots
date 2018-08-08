require 'rails_helper'

RSpec.describe Spot, type: :model do
  # Association test
  # ensure Spot model has a 1:m relationship with the Rating model
  it { should have_many(:ratings).dependent(:destroy) }

  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
