class UserController < ApplicationController
  def manager
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
    if params[:username].empty?
      #To access the value entered into the form use params[:username]
      #So to print out the username that was entered as an alert you 
      #would do flash.now[:alert] = "#{params[:username]} was entered"
      flash.now[:alert] = "Username Can't be blank!"
    else
      
    end 
  end
end
