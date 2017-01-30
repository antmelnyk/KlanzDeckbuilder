class DecksController < ApplicationController
  def index
    @decks = Deck.all.page(params[:page]).per(20)
  end

  def user_index
    @decks = current_user.decks
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new(params[:deck])
    @cards = Card.all.page(params[:page])
  end

  def create
    @deck.user = current_user
    if @deck.save
      redirect_to @deck
    else
      render 'index'
    end
  end

  private


end
