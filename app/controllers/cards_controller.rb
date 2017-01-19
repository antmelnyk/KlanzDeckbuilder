class CardsController < ApplicationController
  def index
    if current_page?(:controller => 'cards', :action => 'index')
      @cards = Card.all.page(params[:page]).per(15)
      else
    end
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
