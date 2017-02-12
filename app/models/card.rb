class Card < ApplicationRecord
  has_and_belongs_to_many :decks

  scope :clan, -> clan { where clan: clan }
  scope :rarity, -> rarity { where rarity: rarity }
  scope :star, -> { where star: true }
  scope :power, -> power { where power: power }
  scope :damage, -> damage { where damage: damage}

  # Handling search queries
  MODIFIER = [/\A(эхо)|\A(гнев)|\A(крах)/]


  def correct_query(search)
    case search
      when '+ атака'
        /\+[0-9]* (атак)/
      when '- атака'
        /-[0-9]* (атак)/
      when '+ сила'
        /\+[0-9]* (сил)/
      when '- сила'
        /-[0-9]* (сил)/
      when '+ жизнь'
        /\+[0-9]* (жизн)/
      when '- жизнь'
        /-[0-9]* (сил)/

      else
        search
    end
  end

  scope :search, -> search do
    search = Card.correct_query(search)
    where("ability ~* ?", "(first|last)\s+(last|first)")
    where "ability ILIKE ? OR name ILIKE ?", "%#{search}%", "%#{search}%"
  end

end
