class SessionController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.role=='superadmin'
        redirect_to administrator_path
      elsif user.role == 'admin'
        redirect_to administrator_path
      elsif user.role == 'instructor'
        redirect_to mycourses_path
      else
        redirect_to  action: 'mycourse', controller: 'course'
      end
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash[:alert]="Login unsuccessful. Please try again"
      redirect_to url_for( :action => :new)
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
