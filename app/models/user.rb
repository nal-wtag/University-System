class User < ApplicationRecord
  include Clearance::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :student_department, class_name:"Department", inverse_of: 'students',optional:true
  belongs_to :teacher_department, class_name:"Department", inverse_of: 'teachers',optional:true
  belongs_to :department_head_department, class_name:"Department",inverse_of: 'head', optional:true
  has_many :taken_courses,foreign_key: 'student_id',dependent: :destroy
  has_many :student_courses, class_name: "Course",through: :taken_courses, :source => :course,dependent: :destroy
  has_many :courses,foreign_key:'teacher_id',dependent: :destroy
  enum role: { teacher: 1, student: 2, admin: 3}
  validates :role, presence: true
  validates :name, presence: true
  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks
  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks
  #validates_uniqueness_of :department_head_department_id, :allow_blank=>true, message: "can not have more than one department head"
  validates :department_head_department_id, uniqueness: true, :allow_blank => true

end
