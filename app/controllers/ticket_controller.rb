class TicketController < ApplicationController

	def addToTicket(
		unless(Ticket.find(session[:tableID])
		       @ticket = ticket.new(
			       table = :tableID
		       )
		end
		@ticket.items += create.orderitem(
			item = param[:item_id],
			ingredients = param[:good_ingredients],
		       	notes = param[:notes],

		)
		recalcTotal
		redirect_to guest_path
	end

	private
		def recalcTotal
			#add all items to total and set total with tax
		end


end
