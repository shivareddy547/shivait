class AdministratorController < ApplicationController

  # TODO: implement edit

  def index
    @users = User.where("role='admin'")
  end

  def new
    @user = User.new
    @action = 'create'
  end

  def create
    @user = User.new(user_params)
    @user.role='admin'
    if @user.save
      flash[:notice]= "New admin created"
      redirect_to url_for( :action => :index)
    else
      flash[:alert]="Failed to create Admin"
      redirect_to url_for( :action => :index)
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice]='Admin was deleted'
      redirect_to url_for( :action => :index)
    else
      flash[:alert]='Admin creation failed'
      redirect_to url_for( :action => :index)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def course_params
    params.require(:course).permit(:number, :title, :desc,:startDate,:endDate,:status)
  end


  def courselist
    @courses = Course.all
  end

  def newcourse
    @course = Course.new
    @action = 'create'
  end

  def createcourse
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]= "New Course created"
      redirect_to url_for( :action => :courselist)
    else
      flash[:alert]="Failed to create Course"
      redirect_to url_for( :action => :courselist)
    end
  end

  def editcourse

  end

  def deletecourse
    @course = Course.find(params[:id])
    if @course.destroy
      flash[:notice]='Course was deleted'
      redirect_to url_for( :action => :courselist)
    else
      flash[:alert]='Course deletion failed'
      redirect_to url_for( :action => :courselist)
    end
  end

  def instructorlist
    @users=User.where("role='instructor'")
  end

  def newinstructor
    @user = User.new
    @action = 'createinstructor'
  end

  def createinstructor
    @user = User.new(user_params)
    @user.role='instructor'
    if @user.save
      flash[:notice]= "New instructor created"
      redirect_to url_for( :action => :instructorlist)
    else
      flash[:alert]="Failed to create instructor"
      redirect_to url_for( :action => :instructorlist)
    end
  end

  def deleteinstructor
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice]='Instructor was deleted'
      redirect_to url_for( :action => :instructorlist)
    else
      flash[:alert]='Instructor deletion failed'
      redirect_to url_for( :action => :instructorlist)
    end
  end

end
