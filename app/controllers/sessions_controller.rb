class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new
    end
  end

  # remove cookie
  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end