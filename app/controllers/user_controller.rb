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
    begin params[:username]
      #To access the value entered into the form use params[:username]
      #So to print out the username that was entered as an alert you 
      #would do flash.now[:alert] = "#{params[:username]} was entered"
      if params[:alert].empty?
        flash.now[:alert] = "Username Can't be blank!"
      else
      end
    rescue
      flash.now[:alert] = "Username can't be blank"
    end 
  end
end
