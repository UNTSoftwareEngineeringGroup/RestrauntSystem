class TicketController < ApplicationController

	def calcTotal
		puts("calculating total!!!!")
		check = session[:ticket]
		check.update(:subtotal => 0)
		comp = 0
		puts(check.total)
		orderItems = check.orderItems.all
		orderItems.each do |item|
			temp = Menuitem.find_by(id: item.item)
			check.update(:subtotal => (check.subtotal + temp.price))
			unless item.compitem.nil?
				comp = comp + item.compitem.amount
			end
				puts("*****ORDER ITEM FOUND*****")
		#add all items to total and set total with tax
		end

		# check reward points   
		if current_guestaccount#########NOT WORKING ATM
			if current_guestaccount.points > 4
				check.update(:subtotal => (check.subtotal - 10.00))
			end
		end

		#add tax
		check.update(:tax => (check.subtotal * 0.0825))
	   unless check.gratuity.nil?
			check.update(:total => (check.tax + check.subtotal + check.gratuity - comp))
		else
			check.update(:total => (check.tax + check.subtotal - comp))
		end
		#total cannot be negative due to discount
		if check.total < 0
			check.update(:total => 0)
		end
	
	end

	def addToTicket
	  ticket = Ticket.find_by(table: session[:table_id])
	  if (ticket.nil?) || (ticket.tstatus == 9)
	    ticket = Ticket.create(table: session[:table_id], tax: 0, tstatus: 0 )   
	    session[:ticket] = ticket
	    puts("**********Ticket created************")
	  end
	     ticket.orderItems.create(
	            item: (Menuitem.find_by(name: params[:item_name]).id),
	            ingredients: params[:good_ingredients],
	            notes: params[:notes],
	            istatus: 0
	        )
	        session[:ticket] = ticket
	        puts("**************Ticket added to***********")
	        calcTotal
	        redirect_to guest_path
	    
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

	def advance_ticket
		check = Ticket.find_by(table: session[:table_id])
		
		if (check.tstatus == 0)
			check.update(:tstatus => 1)
		elsif (check.tstatus == 1)
			check.update(:tstatus => 2)
		end

		puts("NEW STATUS OF TICKET: #{check.tstatus}")
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
