class TicketController < ApplicationController


	def addToTicket
  session[:tableID] = "10"
  ticket = Ticket.where(table: session[:tableID]).first
  if ticket.nil?
    ticket = Ticket.create(table: session[:tableID], tax: "8.25", tstatus: 0 )   
    session[:ticket] = check
    puts("**********Ticket created************")
    redirect_to guest_path
  else
     ticket.orderItems.create(
            item: (MenuItem.find_by id: params[:item_id]),
            ingredients: params[:good_ingredients],
            notes: params[:notes],
            istatus: 0
        )
        session[:ticket] = ticket
        puts("**************Ticket added to***********")
        redirect_to guest_path
    end
end

	def checkTicketStatus
		ticketDone = 2
		ticket = Ticket.find(params[:ticket_id])
		torderItems = ticket.orderItems.all

		numComplete = 0
		torderItems.each do |orderItem|
			if(orderItem.istatus == 2)
				numComplete = numComplete + 1
			end	
		end

		if numComplete == torderItems.count
			ticket.update(:tstatus => ticketDone)
			# this doesn't work??
			redirect_to kitchen_path
		end
	end


	private
		def calcTotal
			check = session[:ticket]
			check.total = 0
			OrderItem.where(id: check.id) do |item|
					puts("*****ORDER ITEM FOUND*****")
			#add all items to total and set total with tax
			end
		end


end
