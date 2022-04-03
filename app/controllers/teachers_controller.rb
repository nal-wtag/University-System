class TeachersController < ApplicationController
  before_action :require_login

  def index
    @teachers=User.teacher
    if params[:query].blank?
      @teachers=User.teacher
    else
      @d1=Department.find_by name:params[:query]
      @teachers = @d1.teachers
      #@students=User.where(student_department_id: @d1.id)

    end
    authorize! :index, TeachersController
  end
  def edit
    @teacher = User.find(params[:id])

    authorize! :edit, TeachersController
  end

  def update
    @teacher = User.find(params[:id])
    if @teacher.update(user_params)

      redirect_to ('/teachers')
    else

      render :edit
    end
    authorize! :edit, TeachersController
  end
  def filter_teachers

      @t=User.teacher.first
      redirect_to ('/teachers')
  end
  private
  def user_params
    params.require(:user).permit( :teacher_department_id)
  end
end
