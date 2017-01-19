class CardsController < ApplicationController
  def index
    @cards = Card.all.page(params[:page]).per(15)
  end

  def show
    @card = Card.find_by(number: params[:number])
  end

end
