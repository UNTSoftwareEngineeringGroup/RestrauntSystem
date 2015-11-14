class Ticket < ActiveRecord::Base
	has_many :orderItems
	belongs_to :compticket
end
