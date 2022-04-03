class HourCalculator
  def self.call(user)
    if(user.role=="teacher")
    total_hour=0
    user.courses.each do|course|
      total_hour=total_hour+(course.credit*3)
    end
    else
      total_hour=0
      user.student_courses.each do|course|
        total_hour=total_hour+(course.credit*3)

      end
    end
    total_hour.to_i
    end
end