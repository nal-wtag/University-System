class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.float "credit"
      t.string "code"
      t.string "title"
      t.string "semester"
      t.timestamps
    end
  end
end
