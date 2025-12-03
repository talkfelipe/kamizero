class ReadNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification, polymorphic: true
  validates :status, inclusion: { in: [true,false] }
  # validate presence true made it difficult to make the reply unread
end
