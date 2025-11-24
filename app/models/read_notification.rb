class ReadNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notice
  validates :status, presence: true
end
