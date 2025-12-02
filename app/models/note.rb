class Note < ApplicationRecord
  belongs_to :student
  has_one :classroom, through: :student
end
