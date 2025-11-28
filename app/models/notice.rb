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
    You will be given an input text containing a notice. Your task is to extract and structure the information into a JSON object with the following keys:

    - "title": The title of the notice.
    - "content": The full body content of the notice.

    Return only the JSON object in the following format:
    {
      "title": "<Extracted title>",
      "content": "<Extracted full body content>"
    }

    Input text:
    Example: Kami Zero Dummy Event Notice
              Sample School Event
              Date: 2025-03-15
              Start time: 09:00
              End time: 11:30
              This is a dummy Word document for testing file upload and parsing in the Kami Zero app.

    PROMPT
    response = RubyLLM.chat.ask(prompt)
    response.content
  end

end
