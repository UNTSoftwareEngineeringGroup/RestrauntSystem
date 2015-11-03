class UserController < ApplicationController
  def manager
  end

  def reports
    if params[:view] == 'revenue'
      #set instance variables for the revenue report here
    elsif params[:view] == 'top sellers'
      #set instance variables for the top sellers report here
      #ex. @best_seller, @second_seller, @third_seller
    end
  end

  def tableview
  end

  def guest
  end

  def waiter
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
          table_id = user.username.byteslice(5,7)
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
    @check.update(:total => 0)
    @items.each do |orderItem|
      menu_item = Menuitem.find_by(id: orderItem.item)
      @check.update(:total => (@check.total + menu_item.price))
    end
  end
end
