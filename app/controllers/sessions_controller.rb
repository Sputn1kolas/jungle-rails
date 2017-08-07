class SessionsController < ApplicationController

  def create
    @email = params[:email].downcase.strip
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      puts "user authenticated.."
      session[:user_id] = user.id
      redirect_to '/'
    else
      puts " not logging in..."
      redirect_to '/login'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/login', error: "Wrong Password or Username"
  end



end
