class SessionsController < ApplicationController

  def create
    @user = User.find_by('email': params[:email])
    puts "params is... #{params}"
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      puts "user authenticated.."
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      puts " not logging in..."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', error: "Wrong Password or Username"
  end

end
