class Notice < ApplicationRecord
  belongs_to :school
  has_many :read_notifications, dependent: :destroy
  validates :category, presence: true
  validates :content, presence: true
  validates :classroom, presence: true
  validates :grade, presence: true

  CATEGORIES = ["Events"]
  GRADES = ["1"]
  CLASSROOM = ["A"]
end
