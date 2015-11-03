Rails.application.routes.draw do

  get 'ticket/addToTicket' => 'ticket#addToTicket'
  get 'ticket/checkTicketStatus' => 'ticket#checkTicketStatus'
  get 'ticket/calcTotal' => 'ticket#calcTotal'
  get 'ticket/advance_ticket' => 'ticket#advance_ticket'

#Ingredients
  get 'ingredients/update_status' => 'ingredients#update_status'

#Order_items
  get 'order_items/show' => 'order_items#show' 
  get 'order_items/addToTicket' => 'order_items#orderToTicket'
  get 'order_items/updateStatus' => 'order_items#updateStatus'
  get 'order_items/remove_item'=> 'order_items#remove_item'

#Users
  get 'manager' => 'user#manager'
  get 'manager/reports' => 'user#reports'
  get 'tableview' => 'user#tableview'
  get 'guest' => 'user#guest'
  get 'kitchen' => 'user#kitchen'
  get 'waiter' => 'user#waiter'
  get 'guest/pay' => 'user#pay'
  get 'login' => 'user#login'
  get 'guest/confirm_order' => 'user#confirm_order'

 #Guestaccount
  get 'signup' => 'guestaccounts#new'
  resources :guestaccounts
  
   get '/guestlogin' => 'sessions#new'
  post 'guestlogin' => 'sessions#create'
  delete 'guestlogout' => 'sessions#destroy'

  
  root "user#login"
end
