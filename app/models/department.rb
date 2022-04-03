class Department < ApplicationRecord
  has_many :students, class_name:"User",inverse_of: 'student_department',foreign_key: 'student_department_id',dependent: :destroy
  has_many :teachers, class_name:"User",inverse_of: 'teacher_department',foreign_key:'teacher_department_id',dependent: :destroy
  has_one :head, class_name:"User", inverse_of:'department_head_department',foreign_key:'department_head_department_id',dependent: :destroy
  has_many :courses,dependent: :destroy
  validates :name, presence: true, uniqueness: true

end
