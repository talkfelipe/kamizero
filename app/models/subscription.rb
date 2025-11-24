class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :school
  validates :grade, presence: true
  validates :classroom, presence: true
end
