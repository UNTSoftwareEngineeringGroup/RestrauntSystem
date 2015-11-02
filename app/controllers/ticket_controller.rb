class TicketController < ApplicationController


	def addToTicket
	  ticket = Ticket.find_by(table: session[:table_id])
	  puts("got table #{ticket.table}")
	  if (ticket.nil?) || (ticket.tstatus == 9)
	    ticket = Ticket.create(table: session[:table_id], tax: "8.25", tstatus: 0 )   
	    session[:ticket] = check
	    puts("**********Ticket created************")
	    redirect_to guest_path
	  else
	     ticket.orderItems.create(
	            item: (MenuItem.find_by(name: params[:item_name]).id),
	            ingredients: params[:good_ingredients],
	            notes: params[:notes],
	            istatus: 0
	        )
	        session[:ticket_id] = ticket.id
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
				check.total = check.total + item.price
					puts("*****ORDER ITEM FOUND*****")
			#add all items to total and set total with tax
			end
		end

	private
		def advanceTicket
			check = session[:ticket]
			check.tstatus = check.tstatus + 1
			redirect_to :back
		end

	private
		def pay
			check = session[:ticket]
			if session[:pay] == "card"#card
				total = ticket.total + session[:gratuity]
				
			else #cash
				

			end
			if ticket.total - total == 0
				check.tstatus = 9
			end
		end



end
