include PgSearch::Model

class Notice < ApplicationRecord
  belongs_to :school
  has_many :read_notifications, dependent: :destroy, as: :notification
  # has_many :read_users, through: :read_notifications, source: :user
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :classroom, optional: true
  has_one_attached :attachment

  scope :templates, -> { where(is_template: true) }
  scope :not_templates, -> { where(is_template: [false, nil]) }

  CATEGORIES = ["Event", "General"]
  SUBGRADES = ["1", "2", "3", "4", "5", "6"]
  SUBCLASSROOMS = ["A", "B", "C", "D"]
  GRADES = ["All", "1", "2", "3", "4", "5", "6"]
  CLASSROOMS = ["All", "A", "B", "C", "D"]

  pg_search_scope :search_by_filters,
    against: [:content, :date],
    using: {
      tsearch: {
        prefix: true
      }
  }

  def self.extract_title_and_content(text)
    prompt = <<~PROMPT
      You will be given the full text of a school notice.

      Text:
      #{text}

      Your task:
      1. Extract a concise title for the notice.
      2. Rewrite the remaining body as clean, well-structured Markdown.
      3. Fill the content with the original language of the text.

      Requirements for the "content" field:
      - Use headings (#, ##) where it makes sense.
      - Use **bold** and *italics* where appropriate.
      - Use bullet points for lists when helpful.
      - Do NOT add any extra commentary.
      - Make sure the Markdown stays inside a valid JSON string (escape quotes and newlines properly).

      Output ONLY valid JSON in exactly this shape:

      {
        "title": "[extracted title]",
        "content": "[remaining content in Markdown]"
      }
    PROMPT

    response = RubyLLM.chat.ask(prompt)
    raw_content = response.content

    # Extract JSON from response (handle cases where LLM adds extra text)
    json_match = raw_content.match(/\{[\s\S]*\}/)
    json_match ? json_match[0] : raw_content
  end

end
