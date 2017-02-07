class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def about
  end

  def stars
    @cards = Card.where(marketable: false).order(number: :asc)
    @current_star = Card.where(number: '1781')
  end

end
