class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:full_name] == "" || user_params[:email] == "" || user_params[:password] == ""
      flash[:notice] = "Please fill in all fields"
      redirect_to '/signup'
    elsif user_params[:password] == user_params[:confirm_password]
      user_info = user_params.except(:confirm_password)
      @user = User.new(user_info)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        flash[:notice] = 'An error occured.'
        redirect_to '/signup'
      end
    else
      flash[:notice] = "Passwords do not match"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :confirm_password)
  end
end
