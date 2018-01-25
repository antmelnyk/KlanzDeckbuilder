Rails.application.routes.draw do
  root 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/stars', to: 'static_pages#stars'
  get '/my_decks', to: 'decks#user_index'
  devise_for :users, controllers: { registrations: "users/registrations" }, :has_many => [:decks]
  resources :cards, param: :number, except: [:edit, :update]
  resources :decks, except: [:edit, :update]
end
