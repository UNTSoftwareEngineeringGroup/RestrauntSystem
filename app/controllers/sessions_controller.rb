class SessionsController < ApplicationController

def new
end

#Logs the user in and redirect to the guest home page
def create
  @guestaccount = Guestaccount.find_by_email(params[:session][:email])
  if @guestaccount && @guestaccount.authenticate(params[:session][:password])
    session[:guestaccount_id] = @guestaccount.id
    redirect_to '/guest?' 
  else
   flash.now[:danger] = "Invalid email/password combination"# alert if wrong password/email combo entered
      render 'new'
  end 
end

#log out out current user
def destroy 
	  session[:guestaccount_id] = nil 
	  
	end
end

