class MenuItemController < ApplicationController
	def change_availability
		item = Menuitem.find_by(name: params[:name])

		case item.available
		when false
			item.update(:available => true)	
		when true
			item.update(:available => false)
		else
			puts("error")
		end

		puts("status changed to #{item.available}")

		redirect_to :back
	end
end
