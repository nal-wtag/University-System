class DepartmentsController < ApplicationController
  before_action :require_login
  load_and_authorize_resource

  def index
    @departments=Department.all

  end

  def show
    @department = Department.find(params[:id])

  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save

      redirect_to  ('/departments')
    else

      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @department = Department.find(params[:id])
  end
  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)

      redirect_to ('/departments')
    else

      render :edit
    end
  end
  def destroy
    @article = Department.find(params[:id])
    @article.destroy

    redirect_to ('/departments')
  end


  def department_params
    params.require(:department).permit(:name, :location)
  end
end
