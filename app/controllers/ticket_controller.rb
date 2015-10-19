class TicketController < ApplicationController


	def addToTicket
		session[:tableID] = "15"
		@ticket = session[:ticket]
		unless defined? @ticket
			session[:ticket] = Ticket.create(
			table: session[:tableID],
			items: (OrderItem.create(
				item: (MenuItem.find_by id: params[:item_id]),
				ingredients: params[:good_ingredients],
				notes: params[:notes]
					)
				)
			)	
			puts("**********Ticket created************")
			redirect_to guest_path
		else
			session[:ticket] = OrderItem.create(
				item: (MenuItem.find_by id: params[:item_id]),
				ingredients: params[:good_ingredients],
				notes: params[:notes]
				
			)
			puts("**************Ticket added to***********")
			redirect_to guest_path
		end
	end


	private
		def calcTotal
			#add all items to total and set total with tax
		end


end