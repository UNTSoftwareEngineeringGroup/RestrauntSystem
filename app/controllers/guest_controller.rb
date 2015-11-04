class GuestController < ApplicationController
	def pay_w_credit
		
	end
	def submit_payment
		check = Ticket.find_by(table: session[:table_id])
		check.update(:tstatus => 9)
		if(check.tstatus == 9) 
			puts('The ticket has been paid for')
		end
		redirect_to guest_confirm_order_path
	end
end
