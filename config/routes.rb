Rails.application.routes.draw do
  root 'decks#new'
  devise_for :users, :has_many => [:decks]
  resources :cards, only: [:index, :show], param: :number
  resources :decks
  get '/my_decks', to: 'decks#user_index'
end
