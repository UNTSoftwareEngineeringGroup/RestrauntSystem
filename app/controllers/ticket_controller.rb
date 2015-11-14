class TicketController < ApplicationController

	#called when an item is added to a ticket
	# This method is copied in it's entirety to 
	# Confirm order method in user_controller
	# Both must be updated in tandem to maintain proper
	# working function.
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
		if current_guestaccount
			# check points
			if current_guestaccount.points > 4
				check.update(:subtotal => (check.subtotal - 10.00))
				check.update(:points => true)
			end
			# check birthday
			if(current_guestaccount.birthday.month == Time.now.month &&
				current_guestaccount.birthday.day == Time.now.day)
				check.update(:birthday => true)
			end
		end

		# check birthday discount
		if check.birthday
			check.update(:subtotal => (check.subtotal - 10.00))
		end

		# check coupon 
		if check.coupon
			check.update(:subtotal => (check.subtotal - 10.00))
		end

		#adjust subtotal for comp
		check.update(:subtotal => (check.subtotal - comp))
		unless check.compticket.nil? 
		check.update(:subtotal => (check.subtotal - check.compticket.amount))
		end
		
		# subtotal cannot be negative due to discounts
		if check.subtotal < 0
			check.update(:subtotal => 0)
		end

		#add tax
		check.update(:tax => (check.subtotal * 0.0825))
	   unless check.gratuity.nil?
			check.update(:total => (check.tax + check.subtotal + check.gratuity))
		else
			check.update(:total => (check.tax + check.subtotal))
		end
	
	end

	# Creates new order item and attaches it to ticket
	# If no ticket exists it is created
	def addToTicket
	  ticket = Ticket.where(table: session[:table_id]).last
	  if (ticket.nil?) || (ticket.tstatus == 9)
	    ticket = Ticket.create(table: session[:table_id], 
										tax: 0, 
										tstatus: 0, 
										birthday: false,
										coupon: false,
										points: false	  )
		# Add 1 to ticket counter   
	    count = Totalticket.first
	    # reset survey variable
	    session[:survey] = false
	    count.update(:total => count.total + 1)
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

	def addToTicketKids
	  @ticket = Ticket.where(table: session[:table_id]).last
	  if (@ticket.nil?) || (@ticket.tstatus == 9)
	    @ticket = Ticket.create(table: session[:table_id], 
										tax: 0, 
										tstatus: 0, 
										birthday: false,
										coupon: false,
										points: false	  )
		# Add 1 to ticket counter   
	    count = Totalticket.first
	    session[:survey] = false
	    count.update(:total => count.total + 1)
	    puts("**********Ticket created************")
	  end
	     @ticket.orderItems.create(
	            item: (Menuitem.find_by(name: params[:item_name]).id),
	            ingredients: params[:good_ingredients],
	            notes: params[:notes],
	            istatus: 0
	        )
	        session[:ticket] = @ticket
	        puts("**************Ticket added to***********")
	        calcTotal 
	end

	# Check status of ticket for kitchen view
	# Advances the ticket beyone the kitchen if
	# all orderItems on the ticket are complete
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

	# Advances the value of the tstatus field for a ticket
	# Used for tracking the progress of the ticket through orders
	def advance_ticket
		check = Ticket.where(table: session[:table_id]).last
		
		if (check.tstatus == 0)
			check.update(:tstatus => 1)
		elsif (check.tstatus == 1)
			check.update(:tstatus => 2)
		end

		puts("NEW STATUS OF TICKET: #{check.tstatus}")
		
		if params[:togo]
			check.update(:togo => params[:togo]) #updates to true
		end
		
		redirect_to :back
	end

	# Adds gratuity to the ticket for proper total calculation
	def update_gratuity
		ticket = Ticket.where(table: session[:table_id]).last
		ticket.update(:gratuity => params[:gratuity])
		redirect_to guest_confirm_order_path
	end

  def kids
    items = []
    items << params[:drink]
    items << params[:entree]
    items << params[:side]

    items.each do |item|
      params[:item_name] = item[:name]
      params[:good_ingredients] = ''
      params[:notes] = ''
      addToTicketKids
    end

    redirect_to guest_url
  end

	private
		# Handles application of credit card payment
		# Used to fake credit card transations
		# Cash payment is handled 
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


public
	def compticket
		@ticket = Ticket.where(table: session[:table_id]).last
		#ticket = session[:ticket]
		unless @ticket.compticket.nil?
			@ticket.compticket.delete
		end
		@ticket.update(:compticket => Compticket.create(
			user: params[:user],
			reason: params[:reason],
			amount: params[:comp_value])
		)
		puts(@ticket.compticket.user)
		puts(@ticket.compticket.reason)
		puts(@ticket.compticket.amount)
		redirect_to guest_confirm_order_path
	end
end
