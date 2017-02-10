class DecksController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:show]

  def index
    if params[:search]
      @decks = Deck.search(params[:search]).page(params[:page]).per(7)
    else
      @decks = Deck.all.page(params[:page]).per(7)
    end
  end

  def user_index
    @decks = Deck.where(user_id: current_user.id).page(params[:page]).per(7)
  end

  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
  end

  def create
    @user = current_user
    @deck = @user.decks.build(deck_params)
    if @deck.save
      redirect_to @deck
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to my_decks_path
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :room, :info, :deck)
  end

end
