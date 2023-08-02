class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params.dig(:session, :email)&.downcase
    if user&.authenticate params.dig(:session, :password)
      flash[:success] = t "controller.sessions.login.success"
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = t "controller.sessions.login.fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
