class Deck < ApplicationRecord

  validates :name,  presence: true, length: { maximum: 40 }
  VALID_DECK_REGEX = /\A([\d]+_){15,}\z/
  validates :deck, format: { with: VALID_DECK_REGEX }
  belongs_to :user
  has_and_belongs_to_many :cards

  after_save :add_cards

  protected

    def add_cards
      cards = self.deck.split /_/
      cards.each { |card| self.cards << Card.where(number: card.to_i).take }
    end

 end
