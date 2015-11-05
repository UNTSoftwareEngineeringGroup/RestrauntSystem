class UserController < ApplicationController
  def manager
  end

  def reports
    if params[:view] == 'revenue'
      @subtotal = 0
      @total = 0
      @tax = 0
      @gratuity = 0
      ticket = Ticket.all
      ticket.each do |bill|
        @subtotal += bill.subtotal unless bill.subtotal.nil? 
        @tax += bill.tax unless bill.tax.nil?
        @gratuity += bill.gratuity unless bill.gratuity.nil?
        @total += bill.total unless bill.total.nil?
      end

      @items_sold = []
      @menuitems = Menuitem.all
      @menuitems.each do |item|
        @items_sold << OrderItem.where(item:item.id).count
      end 
      
    elsif params[:view] == 'top sellers'
      @best_sellers = []
      ['Appetizers','Entrees','Desserts','Drinks'].each do |category|

        top_sell_id = 0
        top_sell_count = 0

        second_sell_id = 0
        second_sell_count = 0

        third_sell_id = 0
        third_sell_count = 0

        menuitems = Menuitem.where(category:category)

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
        
        @best_sellers << Menuitem.where(id:top_sell_id).first
        @best_sellers << Menuitem.where(id:second_sell_id).first
        @best_sellers << Menuitem.where(id:third_sell_id).first
     end
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

  def waiter_refills
    table = Table.find_by(username: "Table#{params[:table]}")
    table.update(refills: params[:drink])    
    redirect_to guest_path
  end

  def kitchen
  end

  def pay
  end

  def login
    begin params[:username].empty?
      user = User.find_by(username: params[:username])
      if user.nil?#if it is nil then it found nothing in User database
        user = Table.find_by(username: params[:username])
        if user.nil? #if user is nill it wasn't found
          flash[:alert] = "Incorrect credientials1!"
        else#Else something was found
          table_id = user.username.byteslice(5,2)
          session[:table_id] = table_id
          session[:username] = user.username
          redirect_to guest_path
        end
      else#Else something was found
        if user.password == params[:password]
          if user.accesslevel == 4
            session[:table_id] = 0
            session[:username] = user.username
            redirect_to manager_path

          elsif user.accesslevel == 3
            session[:table_id] = 0
            session[:username] = user.username
            redirect_to waiter_path

          elsif user.accesslevel == 2
            session[:table_id] = 0
            session[:username] = user.username
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

  def confirm_order
    @check = Ticket.find_by(table: session[:table_id])
    @items = OrderItem.where(:ticket_id => @check.id)
    @check.update(:subtotal => 0)
    @items.each do |orderItem|
      menu_item = Menuitem.find_by(id: orderItem.item)
      @check.update(:subtotal => (@check.subtotal + menu_item.price))
    end
	 @check.update(:tax => (@check.subtotal * 0.0825))
	 unless @check.gratuity.nil?
		 @check.update(:total => (@check.subtotal + @check.tax + @check.gratuity))
	 else
	 @check.update(:total => (@check.subtotal + @check.tax))
	 end
  end

  def refill
    check = Ticket.find_by(table: session[:table_id])
    @items = OrderItem.where(:ticket_id => check.id)
  end
end
