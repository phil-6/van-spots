# app/models/user
class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model associations
  has_many :spots, foreign_key: :created_by
  has_many :ratings, dependent: :destroy, foreign_key: :created_by

  # validations
  validates_presence_of :username,
                        :email,
                        :description,
                        :password_digest
end
