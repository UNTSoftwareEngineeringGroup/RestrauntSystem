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
	  		@orderItem.istatus = inProgress
	  	when inProgress
	  		@orderItem.istatus = done
	  	when done
	  		@orderItem.istatus = inProgress
	  		# check all order items within ticket
  	end

  	logger.debug

  end
end
