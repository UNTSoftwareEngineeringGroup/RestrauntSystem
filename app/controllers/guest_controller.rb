class GuestController < ApplicationController
	def pay_w_credit
		
	end
	def submit_payment
		@email = params[:email];

		check = Ticket.where(table: session[:table_id]).last
		check.update(:tstatus => 9)

		#reset login reward if user has recieved the award
		if current_guestaccount
			if current_guestaccount.points > 4
				current_guestaccount.update(:points => 0)
			end

			current_guestaccount.update(:points => (current_guestaccount.points + 1))
		end

		if @email 
			CreditMailer.creditpay_email(@email, check).deliver_now
		end

		#log the user out
		session[:guestaccount_id] = nil

		if(check.tstatus == 9) 
			puts('The ticket has been paid for')
		end
		
		#redirect to the guest confirm path to show survery
		redirect_to guest_confirm_order_path
	end
end
