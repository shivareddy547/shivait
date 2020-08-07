class StaticPagesController < ApplicationController
  def home

    current_user
    @user = @current_user.present? ? @current_user : User.new
  end

  def help
  end

  def about

  end

  def contact_us

  end

end
