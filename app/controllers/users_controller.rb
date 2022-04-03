class UsersController < Clearance::UsersController

  #before_action :require_login
  before_action :require_login, only: [:show, :edit, :update,:index]

  def index

    @users=User.all

    authorize! :read, User

  end

  def show
    @user = User.find(params[:id])
    @hours=HourCalculator.call(@user)
    authorize! :read, UsersController
  end

  def new
     @user = user_from_params

  end

  def create
    @user = user_from_params

   if @user.save
  #
     redirect_to  ('/users')
    else
     render :new, status: :unprocessable_entity
    end
  end
  #
  #def create
  #@user = user_from_params

  #if @user.save
  #sign_in @user
  #redirect_back_or url_after_create
  #else
  #render template: "users/new"
  #end
  #end

  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params_edit)
      flash[:notice] = 'User was successfully updated!'

      redirect_to @user
    else
      flash[:notice] = 'Failed to update user'
      #render :edit, status: :unprocessable_entity
      redirect_to @user
    end
    authorize! :update, @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to ('/users')
  end
  def department_head
    @user=User.find(params[:id])
  end
  def unassign_head
    @user=User.find(params[:id])
    @user.department_head_department_id=nil
    if @user.save
      flash[:notice] = 'Head of the Department unassigned'
      redirect_to ('/users')
    else
      flash[:error] = 'Failed to unassign head'
      redirect_to ('/users')
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

   def user_from_params
   email = user_params.delete(:email)
   password = user_params.delete(:password)
   name = user_params.delete(:name)
   address = user_params.delete(:address)
  role = user_params.delete(:role)

   Clearance.configuration.user_model.new(user_params).tap do |user|
  user.email = email
  user.password = password
   user.name = name
  user.address = address
  user.role=role
   end
  end
  private
  def user_params
  params[Clearance.configuration.user_parameter] || Hash.new
  end

  def redirect_signed_in_users

  end


  def user_params_edit
     params.require(:user).permit(:name, :email, :address, :password, :role, :department_head_department_id)
  end
  def department_head_params
    params.require(:user).permit(:department_head_department_id)
  end
end
