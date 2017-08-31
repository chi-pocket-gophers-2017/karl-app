class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      # session[:id] = @user.id
      redirect_to root_path, notice: "You are now logged in as #{@user.first_name} #{@user.last_name}."
    else
      # render 'new'
      redirect_to root_path
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :mentor)
  end
end
