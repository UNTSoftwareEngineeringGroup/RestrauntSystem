class OrderItem < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :compitem
end
