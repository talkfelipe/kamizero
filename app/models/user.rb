class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children, class_name: :Student, dependent: :destroy

  has_many :students, through: :classrooms
  has_many :notes, through: :students

  has_many :children_notes, through: :children, source: :notes

  has_many :schools, through: :students
  has_many :classrooms
  has_many :notices, through: :schools
  validates :role, presence: true
  belongs_to :school, optional: true
  has_many :read_notifications
  has_many :read_notices, through: :read_notifications, source: :notice

  def all_notices
    self.notices.where(classroom: [self.classrooms, nil])
  end

  # def all_notes
  #   Note.where(student:{ classroom: self.classrooms })
  # end
end
