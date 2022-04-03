class CoursesController < ApplicationController
  before_action :require_login
  load_and_authorize_resource
  def index
    @courses=Course.all
    if params[:query].blank?
      @courses=Course.all
    else
      @d1=Department.find_by name:params[:query]
      @courses = @d1.courses
      #@students=User.where(student_department_id: @d1.id)

    end
  end

  def show
    @course=Course.find(params[:id])
      end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]="Course successfully added"
      redirect_to ('/courses')
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @course = Course.find(params[:id])
  end
  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      flash[:notice]="Course successfully updated"
      redirect_to ('/courses')
    else
      render :edit, status: :unprocessable_entity
    end
    authorize! :update, Course
  end
  def destroy
    @article = Course.find(params[:id])
    @article.destroy
    redirect_to ('/courses')
  end

  private
  def course_params
    params.require(:course).permit(:title, :credit, :code, :semester, :department_id, :teacher_id)
  end
end
