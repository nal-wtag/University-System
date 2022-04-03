class CreditCalculator
  def self.call(student)
    credit_total=0.0
    student.student_courses.each do|course|
      credit_total=credit_total+course.credit
    end
    credit_total.to_f
  end
end