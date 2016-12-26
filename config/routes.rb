Rails.application.routes.draw do

  get 'trade/index'

  get 'trade/show'

  get 'trade/new'

  get 'trade/accept'

  get 'trade/reject'

  get 'trade/destroy'

  resources :things
  devise_for :users
  get '/home/all_things', to: 'home#all_things', as: 'all_things'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

end
