Rails.application.routes.draw do
  get 'user/manager' => 'user#manager'
  get 'user/guest' => 'user#guest'
  get 'user/kitchen' => 'user#kitchen'
  get 'user/waiter' => 'user#waiter'

  root "user#manager"
end
