class School < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :classrooms, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def general_notices
    self.notices.where(classroom: nil)
  end

end
