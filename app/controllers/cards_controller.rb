class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find_by(number: params[:number])
  end

end
