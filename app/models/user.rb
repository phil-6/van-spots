# app/models/user
class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model associations
  has_many :spots, foreign_key: :user_id
  has_many :ratings, dependent: :destroy, foreign_key: :user_id

  # validations
  validates_presence_of :username,
                        :email,
                        :description,
                        :password_digest
end
