class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
     return redirect_to new_session_path if !logged_in?
      @request = Request.new
      @request.student = current_user
      respond_to do |f|
      if @request.save
        f.html {ActionCable.server.broadcast 'requests',request: @request.student.first_name}
        f.json {ActionCable.server.broadcast 'requests',request: @request.student.first_name}
      else
        render 'new'
      end
    end
  end

  def patch

  end

  def destroy
    # Find the request either by it's id, student_id, or mentor_id
    # Delete that shit
  end
end
