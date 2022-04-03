class StudentsController < ApplicationController
  before_action :require_login
  def index
    @students=User.student
    if params[:query].blank?
      @students=User.student
      else
        @d1=Department.find_by name:params[:query]
        @students = @d1.students
        #@students=User.where(student_department_id: @d1.id)

    end
  end

  def show

    @student=User.find(params[:id])
    @credit=CreditCalculator.call(@student)
  end

  def new
    @tc=TakenCourse.new

  end
  def create

    @tc=TakenCourse.create(student_params)
    if @tc.save

      redirect_to('/users')
    else
      render :new, status: :unprocessable_entity
    end
    end
  def edit
    @student = User.find(params[:id])
  end

  def update

    @student = User.find(params[:id])



    if @student.update(student_params)
      redirect_to ('/departments')
    else

      render :edit
    end

  end
  # def taken_course
  #   @u = User.find(current_user.id)()
  #   @c = Course.find(params[:id])
  #
  #   @u.student_courses << @c
  # end
  def destroy

  end


  def delete


  end
  def assign_department
    @student = User.find(params[:id])
    @student.student_department_id=current_user.department_head_department_id
    if @student.save
      flash[:notice] = 'Assigned'
      redirect_to ('/students')
    else
      flash[:error] = 'Unable to assign'
      redirect_to ('/students')
    end

  end


  def unenroll
    @course=Course.find(params[:course_id])
    @student=User.find(params[:student_id])
    @t1=TakenCourse.where(course_id: @course.id, student_id: @student.id)
    if @t1.first.destroy
      flash[:notice] = 'Unenrolled'
      redirect_to ('/courses')
    else
      flash[:notice] = 'Unable to unenroll'
      redirect_to ('/departments')
      end
    authorize! :unenroll, StudentsController
  end
  private
  def student_params
    #params.require(:taken_course).permit(:student_id, :course_id)
    params.require(:user).permit(:student_course_ids[])

  end

end
