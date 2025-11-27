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

  def self.extract_title_and_content(text)
    prompt = <<~PROMPT
    From the input #{text}, extract and structure the information into the following JSON format with two keys:

    - "title" = "The title of the notice"
    - "content" = "The full body content of the notice"

    Expected output format:
    content => {
      "title" = "Example Title",
      "content" = "Example content of the notice."
    }
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    response.content
  end

end
