class Card < ApplicationRecord
  has_and_belongs_to_many :decks

  scope :clan, -> clan { where clan: clan }
  scope :rarity, -> rarity { where rarity: rarity }
  scope :star, -> { where star: true }
  scope :power, -> power { where power: power }
  scope :damage, -> damage { where damage: damage}

end
