Rails.application.routes.draw do

  get 'ticket/addToTicket' => 'ticket#addToTicket'
  get 'ticket/checkTicketStatus' => 'ticket#checkTicketStatus'

#Order_items
  get 'order_items/show' => 'order_items#show' 
  get 'order_items/addToTicket' => 'order_items#orderToTicket'
  get 'order_items/updateStatus' => 'order_items#updateStatus'

#Users
  get 'manager' => 'user#manager'
  get 'tableview' => 'user#tableview'
  get 'guest' => 'user#guest'
  get 'kitchen' => 'user#kitchen'
  get 'waiter' => 'user#waiter'
  get 'guest/pay' => 'user#pay'
  get 'login' => 'user#login'

 #Guestaccount
  get 'signup' => 'guestaccounts#new'
  resources :guestaccounts
  
   get '/guestlogin' => 'sessions#new'
  post 'guestlogin' => 'sessions#create'
  delete 'guestlogout' => 'sessions#destroy'

  
  root "user#login"
end
