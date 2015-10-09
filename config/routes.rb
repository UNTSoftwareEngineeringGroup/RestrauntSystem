Rails.application.routes.draw do
  get 'order_items/show' => 'order_items#show' 
  get 'manager' => 'user#manager'
  get 'guest' => 'user#guest'
  get 'kitchen' => 'user#kitchen'
  get 'waiter' => 'user#waiter'
  get 'guest/pay' => 'user#pay'
  get 'login' => 'user#login'

  root "user#login"
end
