class Deck < ApplicationRecord
  ROOMS = [%w[Потасовка Потасовка], ['Турнир Арпада', 'Турнир Арпада'], %w[Арена Арена], %w[Ивент Ивент]]
  VALID_ROOM = /\AПотасовка\z|\AТурнир Арпада\z|\AАрена\z|\AИвент\z/
  VALID_DECK_REGEX = /\A([\d]+_){15,}\z/

  validates :name,  presence: true, length: { maximum: 40 }
  validates :room, format: { with: VALID_ROOM }
  validates :deck, format: { with: VALID_DECK_REGEX }
  belongs_to :user
  has_and_belongs_to_many :cards

  before_save :prepare_deck

  # Search decks
  def self.search(search)
    where("name ILIKE ? OR room ILIKE ?", "%#{search}%", "%#{search}%")
  end

  protected

    # Create association with cards and calculate price
    def prepare_deck
      cards = self.deck.split /_/
      cards.map &:to_i
      cards = Card.where number: cards
      self.cards = cards

      star_price = 0
      module_price = 0
      cards.each do |card|
        case card.rarity
          when 'common'
            card.star ? star_price += 20 : module_price += 20
          when 'rare'
            card.star ? star_price += 60 : module_price += 60
          when 'uniq'
            card.star ? star_price += 240 : module_price += 240
          when 'legend'
            card.star ? star_price += 1500 : module_price += 1500
        end
      end

      self.star_price = star_price
      self.module_price = module_price
    end

 end
