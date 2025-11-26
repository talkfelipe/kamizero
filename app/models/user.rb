class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions, dependent: :destroy
  validates :role, presence: true
  belongs_to :school, optional: true
  has_many :read_notifications
  has_many :read_notices, through: :read_notifications, source: :notice

  def notices
    grades = self.subscriptions.pluck(:grade) + ["All"]
    classrooms = self.subscriptions.pluck(:classroom) + ["All"]
    Notice.includes(school: [:notices,:subscriptions])
      .where(school: { subscriptions: { user: self } },
        grade: grades,
        classroom: classrooms
      )
  end
end
