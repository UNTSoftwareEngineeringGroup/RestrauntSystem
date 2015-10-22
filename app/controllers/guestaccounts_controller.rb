class GuestaccountsController < ApplicationController


def new
	@guestaccount = Guestaccount.new
end

#creates new guest account and saves it and redirects to main page after successful signup
def create 
  @guestaccount = Guestaccount.new(guestaccount_params) 
  if @guestaccount.save 
    session[:guestaccount_id] = @guestaccount.id 
    redirect_to '/guest?' 
  else 
    redirect_to '/signup' 
  end 
end

# takes data submitted through signup page and stores it in database
private
  def guestaccount_params
    params.require(:guestaccount).permit(:email, :password , :birthday)
  end





end
