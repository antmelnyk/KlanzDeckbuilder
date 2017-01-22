class DecksController < ApplicationController
  def index
    @decks = Deck.all.page(params[:page])
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
    @cards = Card.all.page(params[:page])
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to @deck
    else
      render 'index'
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:deck, :author)
  end

end
