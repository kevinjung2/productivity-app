Rails.application.routes.draw do
  resources :items
  resources :users, except: [:new, :show] do
    resources :shopping_lists
    resources :events
    get '/hosted', to: 'events#hosted'
  end
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
