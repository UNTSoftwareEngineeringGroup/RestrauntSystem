class IngredientsController < ApplicationController
	def update_status
		ingredient = Ingredient.find_by(name: params[:ingredient_name])

		#Sets available boolean for ingredient
		case ingredient.available
		when 1
			ingredient.update(:available => 0)
		when 0
			ingredient.update(:available => 1)
		else
			puts("error the ingredient doesn't have a status")
		end
	end
end
