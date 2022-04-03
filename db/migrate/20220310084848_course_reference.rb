class CourseReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :department, index: true
  end
end
