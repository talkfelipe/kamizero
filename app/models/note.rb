class Note < ApplicationRecord
  belongs_to :student
  has_one :classroom, through: :student
  has_many :read_notifications, as: :notification
end
