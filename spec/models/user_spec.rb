# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Spot model
  it { should have_many(:spots) }
  # ensure User model has a 1:m relationship with the Rating model
  it { should have_many(:ratings).dependent(:destroy) }

  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:password_digest) }
end
