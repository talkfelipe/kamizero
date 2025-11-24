class School < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :notices, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
