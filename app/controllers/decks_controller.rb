class DecksController < ApplicationController

  def index
    @decks = Deck.all.page(params[:page]).per(20)
  end

  def user_index
    @decks = Deck.where user_id: current_user.id
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def create
    @user = current_user
    @deck = @user.decks.build(deck_params)
    if @deck.save
      redirect_to @deck
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :info, :deck)
  end

end
