class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:id] = @user.id
      logger.info "Saved the user"
      redirect_to @user
    else
      render 'new'
    end
  end

  def new_mentor
    @user = User.new
    render 'new_mentor'
  end

  def create_mentor
    @user = User.new(allowed_params)
    @user.mentor = true
    if @user.save
      session[:id] = @user.id
      redirect_to @user
    else
      render 'new_mentor'
    end
  end

  def show
    @pending_requests = Request.where(mentor_id: nil)
    @requests_in_progress = Request.where('mentor_id is not null')
    @request = current_user.requests.first
  end

  def edit
    if request.xhr?
      render '_edit_picture_form', layout: false
    end 
  end 

  private

  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
