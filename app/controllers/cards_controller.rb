class CardsController < ApplicationController
  has_scope :clan
  has_scope :rarity
  has_scope :star, :type => :boolean
  has_scope :power
  has_scope :damage

  def index
    @cards = apply_scopes(Card).all.order(number: :desc).page(params[:page]).per(20)
    @deck = Deck.new
  end

  def show
    @card = Card.find_by(number: params[:number])
  end

  private

 end
