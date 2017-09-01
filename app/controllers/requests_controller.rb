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
        f.html {ActionCable.server.broadcast 'requests',request: {name: @request.student.full_name, created_at: @request.created_at}}
        f.json {ActionCable.server.broadcast 'requests',request: @request.student.full_name}
      else
        render 'new'
      end
    end
  end

  def update
    if logged_in?
      @delete = Request.where(mentor_id: current_user.id)
      @delete.destroy_all
      @request = Request.where(mentor_id: nil).first
      @request.mentor_id = current_user.id
      @request.save
      redirect_to '/queue'
    else
      redirect_to new_session_path
    end
  end

  def destroy
    post = Request.find(params[:id])
    post.destroy
    redirect_to '/queue'
  end
end
