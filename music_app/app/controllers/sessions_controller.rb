class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      [:user][:email],
      [:user][:password]
    )

    if user
      log_in_user(user)
      redirect_to user_url
    else
      flash.now[:errors] = ['Incorrect username and/or password.']
      render :new
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end
end
