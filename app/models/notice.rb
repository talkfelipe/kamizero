include PgSearch::Model

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
  return nil if date.blank? || start_time.blank?
    DateTime.parse("#{date} #{start_time}")
  end

  def ends_at
    return nil if date.blank? || end_time.blank?
    DateTime.parse("#{date} #{end_time}")
  end

  def duration_in_minutes
    return 30 if starts_at.nil? || ends_at.nil? # fallback
    ((ends_at - starts_at) * 24 * 60).to_i
  end
end
