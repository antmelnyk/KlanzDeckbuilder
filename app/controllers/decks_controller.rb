class DecksController < ApplicationController
  def index
    @decks = Deck.all.page(params[:page]).per(5)
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
