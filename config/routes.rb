Rails.application.routes.draw do

  get 'trade/index'

  get 'trade/show'

  #get 'trade/new'

  get 'trade/new/:user_id,:thing_id', to: 'trade#new', as: 'trade_new'

  #get 'trade/accept'
   get 'trade/accept/:user_id,:user2_id,:thing_id,:thing2_id', to: 'trade#accept', as: 'trade_accept'

  get 'trade/reject'

  get 'trade/destroy'

  resources :things
  devise_for :users
  get '/home/all_things', to: 'home#all_things', as: 'all_things'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

end
