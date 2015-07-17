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

  def edit
    @user = User.find(params[:id])
  end

  def update #this takes the new data and sends it to the db to store.S
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to current_user, notice: 'Settings were successfully updated.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :confirm_password)
  end
end
