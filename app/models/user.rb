class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # model associations
  has_many :spots, foreign_key: :user_id
  has_many :ratings, dependent: :destroy, foreign_key: :user_id

  # validations
  validates_presence_of :username,
                        :email,
                        :description
end
