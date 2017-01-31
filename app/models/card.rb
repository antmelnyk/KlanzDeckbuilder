class Card < ApplicationRecord

  scope :clan, -> clan { where clan: clan }
  scope :rarity, -> rarity { where rarity: rarity }
  scope :star, -> { where star: true }
  scope :power, -> power { where power: power }
  scope :damage, -> damage { where damage: damage}

end
