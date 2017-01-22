Rails.application.routes.draw do
  root 'decks#new'
  devise_for :users
  resources :cards, only: [:index, :show], param: :number
  resources :decks
end
