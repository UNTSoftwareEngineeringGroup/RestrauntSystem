class TicketController < ApplicationController


	def addToTicket
		session[:tableID] = "15"
		unless defined? check
			check = Ticket.create(
			table: session[:tableID],
			tax: "8.25",
			tstatus: 0
			)	
			session[:ticket] = check
			puts("**********Ticket created************")
			redirect_to guest_path
		else
			check.orderItems.create(
				item: (MenuItem.find_by id: params[:item_id]),
				ingredients: params[:good_ingredients],
				notes: params[:notes],
				istatus: 0
			)
			session[:ticket] = check
			puts("**************Ticket added to***********")
			redirect_to guest_path
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
