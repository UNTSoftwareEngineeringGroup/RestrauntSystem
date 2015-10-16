class TicketController < ApplicationController


	def addToTicket
		session[:tableID] = "15"
    if @ticket != NIL
	
   @ticket = Ticket.new(
	table: session[:tableID],
	items: (OrderItem.create(
		item: (MenuItem.find_by_id id: params[:item_id]),
		ingredients: params[:good_ingredients],
		notes: params[:notes]
									)

			 )
	)	
		redirect_to guest_path
	else
		redirect_to guest_path
 	 end
	end
	private
		def recalcTotal
			#add all items to total and set total with tax
		end


end
