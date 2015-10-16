class TicketController < ApplicationController

	def addToTicket
    #please remove following line before production
    session[:table_id] = 5
		unless Ticket.where(:table => session[:table_id]).first
		       @ticket = Ticket.new (table: 15, items: NIL)
    end
#    @ticket = Ticket.where(:table => session[:table_id]
#		@ticket.items += create.orderitem(
#			item = param[:item_id],
#			ingredients = param[:good_ingredients],
#		       	notes = param[:notes],

#		)
#		recalcTotal
		redirect_to guest_path
	end

	private
		def recalcTotal
			#add all items to total and set total with tax
		end


end
