Rails.application.routes.draw do
  root 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/my_decks', to: 'decks#user_index'
  devise_for :users, controllers: { registrations: "users/registrations" }, :has_many => [:decks]
  resources :cards, param: :number, only: [:index, :show]
  resources :decks, except: [:edit, :update]
end
