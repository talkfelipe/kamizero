class Classroom < ApplicationRecord
  belongs_to :user
  has_many :students, dependent: :destroy
  has_many :notices, dependent: :destroy
  belongs_to :school
end
