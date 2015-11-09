class MenuItemController < ApplicationController
	#change availability of menu items
	#if a menu item's availability is set to false,
	#the item will not be shown in the menu

	#kitchen staff and managers have authority to change these values
	#in the back of house interface

	def change_availability
		#find the selected menu item
		item = Menuitem.find_by(name: params[:name])

		#sets availability boolean for menu items.
		case item.available
		when false
			item.update(:available => true)	
		when true
			item.update(:available => false)
		else
			puts("error")
		end
		
		redirect_to :back
	end
end
