class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    if logged_in?
      @request = Request.new
      @request.student = current_user
      if @request.save
        redirect_to root_path
      else
        render 'new'
      end
    else
      redirect_to new_session_path
    end
  end

  def patch

  end

  def destroy
    # Find the request either by it's id, student_id, or mentor_id
    # Delete that shit
  end
end
