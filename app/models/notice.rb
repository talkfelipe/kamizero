class Notice < ApplicationRecord
  belongs_to :school
  has_many :read_notifications, dependent: :destroy
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :classroom, presence: true
  validates :grade, presence: true

  CATEGORIES = ["Events", "General"]
  GRADES = ["All", "1", "2", "3", "4", "5", "6"]
  CLASSROOM = ["All", "A", "B", "C", "D"]
end
