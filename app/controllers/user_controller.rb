class UserController < ApplicationController
  def manager
  end

  #Generates reports based on which report is selected
  def reports

    # Revenue report initialization
    if params[:view] == 'revenue'
      @subtotal = 0
      @total = 0
      @tax = 0
      @gratuity = 0
      @birthdays = 0
      @points = 0
      @coupons = 0
      ticket = Ticket.all
      #Sum values from all tickets
      ticket.each do |bill|
        @subtotal += bill.subtotal unless bill.subtotal.nil? 
        @tax += bill.tax unless bill.tax.nil?
        @gratuity += bill.gratuity unless bill.gratuity.nil?
        @total += bill.total unless bill.total.nil?
        @birthdays += 1 if bill.birthday
        @points += 1 if bill.points
        @coupons += 1 if bill.coupon
      end
      #Generate list and attach values
      @items_sold = []
      @menuitems = Menuitem.all
      @menuitems.each do |item|
        @items_sold << OrderItem.where(item:item.id).count
      end 
    # Top seller report  
    elsif params[:view] == 'top sellers'
      @best_sellers = []
      ['Appetizers','Entrees','Desserts','Drinks'].each do |category|
        #initialize values to zero
        top_sell_id = 0
        top_sell_count = 0

        second_sell_id = 0
        second_sell_count = 0

        third_sell_id = 0
        third_sell_count = 0

        menuitems = Menuitem.where(category:category)
        #total and organize top 3 of each catagory
        menuitems.each do |item|
          items_sold = OrderItem.where(item:item.id).count
          if items_sold > top_sell_count
            third_sell_id = second_sell_id
            third_sell_count = second_sell_count
            
            second_sell_id = top_sell_id
            second_sell_count = top_sell_count
  
            top_sell_id = item.id
            top_sell_count = items_sold
  
          elsif items_sold > second_sell_count
            third_sell_id = second_sell_id
            third_sell_count = second_sell_count
              
            second_sell_id = item.id
            second_sell_count = items_sold
  
          elsif items_sold > third_sell_count
            third_sell_id = item.id
            third_sell_count = items_sold
          end
        end
        
        #print top sellers
        @best_sellers << Menuitem.where(id:top_sell_id).first
        @best_sellers << Menuitem.where(id:second_sell_id).first
        @best_sellers << Menuitem.where(id:third_sell_id).first
     end
     #Comp item report
    elsif params[:view] == 'compitem'
      orderitems = OrderItem.where(compitem:true)
      @compitems = []
      @menuitem = []
      orderitems.each do |order|
        @compitems << Compitem.where(id:order.compitem_id).first
        @menuitem << Menuitem.where(id:order.item).first
      end 
    end
  end

  def tableview
  end

  def guest
  end

  def waiter
  end

  #Generates list of drinks that need refill for waiter tables view
  def waiter_refills
    table = Table.find_by(username: "Table#{params[:table]}")
    table.update(refills: params[:drink])    
    redirect_to guest_path
  end

  #Generates help message for waiter if help or pay cash button pressed
  def waiter_help 
	table = Table.find_by(username: "Table#{params[:table]}")
	table.update(help: true)
    if params[:paying_cash]
      redirect_to guest_confirm_order_path, :paying_cash => true
    else
  	 redirect_to guest_path
    end
  end

  # Allows waiter/manager to reset status of table
  # Clears refill and help requests
  def reset_status
	table = Table.find_by(username: "Table#{params[:table]}")
	table.update(refills: nil, help: false)
	redirect_to waiter_path
  end

  def kitchen
  end

  def pay
  end

  #Initial login
  #Check users and Table database for logins
  def login
    begin params[:username].empty?
      user = User.find_by(username: params[:username])
      if user.nil?#if it is nil then it found nothing in User database
        user = Table.find_by(username: params[:username])
        if user.nil? #if user is nill it wasn't found in Table database
          flash[:alert] = "Incorrect credientials1!"
        else#Else Table was found
          table_id = user.username.byteslice(5,2)
          session[:table_id] = table_id
          session[:username] = user.username
          session[:accesslevel] = 1
          redirect_to guest_path
        end
      else#Else manager was found
        if user.password == params[:password]
          if user.accesslevel == 4
            session[:table_id] = 0
            session[:username] = user.username
            session[:accesslevel] = 4
            redirect_to manager_path
            #Server was found
          elsif user.accesslevel == 3
            session[:table_id] = 0
            session[:username] = user.username
            session[:accesslevel] = 3
            redirect_to waiter_path
            #Kitchen was found
          elsif user.accesslevel == 2
            session[:table_id] = 0
            session[:username] = user.username
            session[:accesslevel] = 2
            redirect_to kitchen_path
          end
        else
          flash[:alert] = "Incorrect credientials123!"
        end
      end
    rescue
      flash.now[:alert] = "Username can't be blank"
    end 
  end

  #allows server/manager to emulate table for customer
  def waiter_table_gateway
    puts(params[:table_id])
    session[:table_id] = params[:table_id]
    redirect_to guest_confirm_order_path
  end

  #Calculates total for payment and notification
  #Before and after ticket is sent to kitchen or ready
  # to be cashed out
  def confirm_order
    @check = Ticket.find_by(table: session[:table_id])
    if @check.nil?
      puts("ticket not created yet!")
      return
    end
    @items = OrderItem.where(:ticket_id => @check.id)
    @check.update(:subtotal => 0)
	 # Add item totals
	 comp = 0
    @items.each do |orderItem|
      menu_item = Menuitem.find_by(id: orderItem.item)
      @check.update(:subtotal => (@check.subtotal + menu_item.price))
		unless orderItem.compitem.nil?
			comp = comp + orderItem.compitem.amount
		end
    end

	 
	 # check reward points
	 if current_guestaccount
		 # check points
		 if current_guestaccount.points > 4
			 @check.update(:subtotal => (@check.subtotal - 10.00))
			 @check.update(:points => true)
		 end
		 # check birthday
		 if (current_guestaccount.birthday.month == Time.now.month &&
			  current_guestaccount.birthday.day == Time.now.day)
			 @check.update(:birthday => true)
		 end
	 end
	 
	 # check birthday discount
	 if @check.birthday
		 @check.update(:subtotal => (@check.subtotal - 10.00))
	 end
	 
	 # check coupon
	 if @check.coupon
		 @check.update(:subtotal => (@check.subtotal - 10.00))
	 end

	 #adjust subtotal for comp
	 @check.update(:subtotal => (@check.subtotal - comp))
   @check.update(:subtotal => (@check.subtotal - @check.compticket.amount))

	 # subtotal cannot be negative
	 if @check.subtotal < 0
		 @check.update(:subtotal => 0)
	 end

	 # calculate tax
	 @check.update(:tax => (@check.subtotal * 0.0825))
	 
	 unless @check.gratuity.nil?
		 @check.update(:total => (@check.subtotal + @check.tax + @check.gratuity))
	 else
	 @check.update(:total => (@check.subtotal + @check.tax))
	 end
  end

  #Sends refill message to table view for server/managers to see
  def refill
    check = Ticket.find_by(table: session[:table_id])
	 unless check.nil?
		@items = OrderItem.where(:ticket_id => check.id)
	 end
  end
end
