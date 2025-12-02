class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # parent
  has_many :children, class_name: :Student, dependent: :destroy
  has_many :schools, through: :children
  has_many :children_notes, through: :children, source: :notes
  has_many :children_classrooms, through: :children, source: :classroom
  has_many :parent_general_notices, through: :schools, source: :notices
  has_many :parent_classroom_notices, through: :children_classrooms, source: :notices


  #teacher
  belongs_to :school, optional: true
  has_many :classrooms
  has_many :students, through: :classrooms
  has_many :teacher_grade_notices, through: :classrooms, source: :notices
  has_many :teacher_general_notices, through: :school, source: :notices
  #general
  has_many :notes, through: :students

  validates :role, presence: true
  has_many :notices, through: :school
  has_many :read_notifications
  has_many :read_notices, through: :read_notifications, source: :notice

  def parent_notices
    self.parent_general_notices.where(classroom: [nil, self.children_classrooms])
  end

  def teacher_notices
    self.teacher_general_notices.where(classroom: [nil, self.classrooms])
  end
end
