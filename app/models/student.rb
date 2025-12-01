class Student < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :classroom
  has_many :notes, dependent: :destroy
  validates :name, presence: true
end
