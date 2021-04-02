Rails.application.routes.draw do
  resources :items
  resources :shopping_lists
  resources :events
  resources :users, except: [:new, :show]
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
