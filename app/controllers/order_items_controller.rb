class OrderItemsController < ApplicationController
  def show
  end

  def addToTicket
	
    redirect_to guest_path
  end

  def updateStatus
  	unClaimed = 0
  	inProgress = 1
  	done = 2


  	@ticket = Ticket.find(params[:ticket_id])
  	@orderItem = @ticket.orderItems.find(params[:order_id])


  	case @orderItem.istatus
	  	when unClaimed
	  		@orderItem.update(:istatus => inProgress)
	  	when inProgress
	  		@orderItem.update(:istatus => done)
	  		redirect_to ticket_checkTicketStatus_path(:ticket_id => @ticket.id)	  		
	  	when done
	  		@orderItem.update(:istatus => inProgress)
  	end
  end
end
