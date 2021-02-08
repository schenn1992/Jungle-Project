class SessionsController < ApplicationController
  
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save user.id inside browser cookie and redirect to homepage
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  #delete cookie
  def destroy
   session[:user_id] = nil
   redirect_to '/login'
  end

end