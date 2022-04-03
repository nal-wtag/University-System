class AddTeachersController < ApplicationController

  def index
    @teachers=User.teacher
    authorize! :index, UsersController
  end

  def edit
    @course=Course.find(params[:id])

    if (current_user.role=="student")
      @student=User.find(current_user.id)

      puts @student.id
      @tc=TakenCourse.new(student_id:@student.id,course_id:@course.id)
      if(!@tc.save)
        redirect_to('/add_teachers')
      end
      authorize! :create, TakenCourse
    end
  end
  def update
    @course = Course.find(params[:id])
    if (current_user.role== "admin" || (current_user.role=="teacher" && current_user.department_head_department_id!=nil))
    if @course.update(course_params)
      redirect_to @course, notice: "You have assigned teacher"
    else
      render :edit, status: :unprocessable_entity
    end
    end
    authorize! :update, Course
  end
  private
  def course_params
    params.require(:course).permit(:teacher_id)
  end
end
