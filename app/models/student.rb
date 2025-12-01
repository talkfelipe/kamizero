class Student < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :classroom
  validates :name, presence: true
end
