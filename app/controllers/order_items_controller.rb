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
      else
        puts("error order item doesn't have a valid status")
  	end
  end

  def remove_item
    puts("THIS IS THE ID: #{params[:item_id]}")
    @orderItem = OrderItem.find_by(item: params[:item_id])
    if(@orderItem.nil?)

    else 
        @orderItem.destroy
        # redirect_to ticket_calcTotal_path
    end
    redirect_to guest_confirm_order_path
  end

  def comp
    @orderItem = OrderItem.find_by(item: params[:item_id])
    @orderItem.update(:compitem => Compitem.create(
      user: params[:user],
      reason: params[:reason],
      amount: params[:comp_value])
    )
    puts(@orderItem.compitem.user)
    puts(@orderItem.compitem.reason)
    puts(@orderItem.compitem.amount)
    redirect_to guest_confirm_order_path(:view => 'waiter')
  end
end
