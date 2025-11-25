class Notice < ApplicationRecord
  belongs_to :school
  has_many :read_notifications, dependent: :destroy
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :classroom, presence: true
  validates :grade, presence: true
  has_one_attached :attachment

  CATEGORIES = ["Event", "General"]
  GRADES = ["All", "1", "2", "3", "4", "5", "6"]
  CLASSROOMS = ["All", "A", "B", "C", "D"]
end
