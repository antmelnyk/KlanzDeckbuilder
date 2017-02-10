class Deck < ApplicationRecord
  ROOMS = [%w[Потасовка Потасовка], ['Турнир Арпада', 'Турнир Арпада'], %w[Арена Арена]]
  VALID_ROOM = /\AПотасовка\z|\AТурнир Арпада\z|\AАрена\z/
  VALID_DECK_REGEX = /\A([\d]+_){15,}\z/

  validates :name,  presence: true, length: { maximum: 40 }
  validates :room, format: { with: VALID_ROOM }
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
