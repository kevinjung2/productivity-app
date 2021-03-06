Rails.application.routes.draw do
  root 'users#show'
  resources :items
  resources :users, except: [:new, :show] do
    resources :shopping_lists,  except: [:new, :create]
    resources :events
    get '/hosted', to: 'events#hosted'
  end
  resources :amounts, only: :destroy
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create_fb'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
