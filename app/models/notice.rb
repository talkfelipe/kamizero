include PgSearch::Model

class Notice < ApplicationRecord
  belongs_to :school
  has_many :read_notifications, dependent: :destroy
  # has_many :read_users, through: :read_notifications, source: :user
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :classroom, presence: true
  validates :grade, presence: true
  has_one_attached :attachment

  CATEGORIES = ["Event", "General"]
  SUBGRADES = ["1", "2", "3", "4", "5", "6"]
  SUBCLASSROOMS = ["A", "B", "C", "D"]
  GRADES = ["All", "1", "2", "3", "4", "5", "6"]
  CLASSROOMS = ["All", "A", "B", "C", "D"]

  pg_search_scope :search_by_filters,
    against: [:content, :date, :grade, :classroom],
    using: {
      tsearch: {
        prefix: true
      }
  }

  def starts_at
    return nil if date.nil? || start_time.nil?
    DateTime.new(date.year, date.month, date.day, start_time.hour, start_time.min)
  end

  def ends_at
    return nil if date.nil? || end_time.nil?
    DateTime.new(date.year, date.month, date.day, end_time.hour, end_time.min)
  end

  def duration_in_minutes
    return 0 if ends_at.nil? || starts_at.nil?
    ((ends_at - starts_at) * 24 * 60).to_i
  end
end
