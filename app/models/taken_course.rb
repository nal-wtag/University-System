class TakenCourse < ApplicationRecord
  belongs_to :'student',class_name:"User"
  belongs_to :course
  validates_uniqueness_of :student_id, scope: :course_id
end
