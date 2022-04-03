class TeacherReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :teacher, index: true
  end
end
