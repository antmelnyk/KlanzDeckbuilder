class CardsController < ApplicationController
  def index
      @cards = Card.all.page(params[:page]).per(15)
  end

  def show
    @card = Card.find_by(number: params[:number])
  end

  def create_deck
    @deck = Deck.new(params[:deck])
    if @deck.save
      redirect_to @deck
    else
      render 'index'
    end
  end

end
