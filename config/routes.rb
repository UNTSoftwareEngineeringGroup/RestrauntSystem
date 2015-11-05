Rails.application.routes.draw do

  get 'ticket/addToTicket' => 'ticket#addToTicket'
  get 'ticket/checkTicketStatus' => 'ticket#checkTicketStatus'
  get 'ticket/calcTotal' => 'ticket#calcTotal'
  get 'ticket/advance_ticket' => 'ticket#advance_ticket'
  get 'ticket/update_gratuity' => 'ticket#update_gratuity'

#Ingredients
  get 'ingredients/update_status' => 'ingredients#update_status'

#Order_items
  get 'order_items/show' => 'order_items#show' 
  get 'order_items/addToTicket' => 'order_items#orderToTicket'
  get 'order_items/updateStatus' => 'order_items#updateStatus'
  get 'order_items/remove_item'=> 'order_items#remove_item'
  get 'order_items/comp' => 'order_items#comp'

#Users
  get 'manager' => 'user#manager'
  get 'manager/reports' => 'user#reports'
  get 'tableview' => 'user#tableview'
  get 'guest' => 'user#guest'
  get 'kitchen' => 'user#kitchen'
  get 'waiter' => 'user#waiter'
  get 'waiter/refills' => 'user#waiter_refills'
  get 'waiter/help' => 'user#waiter_help'
  get 'table/reset_status' => 'user#reset_status'
  get 'guest/pay' => 'user#pay'
  get 'login' => 'user#login'
  get 'guest/confirm_order' => 'user#confirm_order'
  get 'guest/refill' => 'user#refill'

 #Guestaccount
  get 'signup' => 'guestaccounts#new'
  resources :guestaccounts
  
   get '/guestlogin' => 'sessions#new'
  post 'guestlogin' => 'sessions#create'
  delete 'guestlogout' => 'sessions#destroy'

  get 'guest/pay_w_credit' => 'guest#pay_w_credit'
  get 'guest/submit_payment' => 'guest#submit_payment'
  get 'guest/thank_you' => 'guest#thank_you'

  get 'user/waiter_table_gateway' => 'user#waiter_table_gateway'

  get 'menu_item/change_availability' => 'menu_item#change_availability'
  
  root "user#login"
end
