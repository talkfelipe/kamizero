class ReadNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification, polymorphic: true
  validates :status, presence: true
end
