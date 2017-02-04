Rails.application.routes.draw do
  root 'cards#index'
  devise_for :users, :has_many => [:decks]
  resources :cards, param: :number, only: [:index, :show]
  resources :decks, except: [:edit, :update]
  get '/my_decks', to: 'decks#user_index'
end
