class SessionsController < ApplicationController

def new
end


def create
  @guestaccount = Guestaccount.find_by_email(params[:session][:email])
  if @guestaccount && @guestaccount.authenticate(params[:session][:password])
    session[:guestaccount_id] = @guestaccount.id
    
  else
   flash.now[:danger] = "Invalid email/password combination"# Not quite right!
      render 'new'
  end 
end

def destroy 
	  session[:guestaccount_id] = nil 
	  
	end
end

