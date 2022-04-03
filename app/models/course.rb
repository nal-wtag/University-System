class Course < ApplicationRecord
  belongs_to :department
  has_many :taken_courses,foreign_key:'course_id',dependent: :destroy
  has_many :students, class_name:"User", through: :taken_courses,dependent: :destroy
  belongs_to :teacher, class_name:"User",optional:true
  validates :title, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end
