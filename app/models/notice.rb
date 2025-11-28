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
    You will be given a block of text in #{text}.

    Extract the title and the remaining body as content.

    Assume:
    -	Title: Select the line that best represents the main topic or purpose of the text — typically the first line or a prominent heading. Choose only the portion that clearly serves as the title.
    -	Content: Extract the remaining text that effectively communicates the core message of the notice. Exclude redundant or non-essential information.

    Format the output like this:
    {
      "title": "[extracted title]",
      "content": "[remaining content]"
    }
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    response.content
  end

end
