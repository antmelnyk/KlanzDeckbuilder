class Card < ApplicationRecord
  has_and_belongs_to_many :decks

  scope :clan, -> clan { where clan: clan }
  scope :rarity, -> rarity { where rarity: rarity }
  scope :star, -> { where star: true }
  scope :power, -> power { where power: power }
  scope :damage, -> damage { where damage: damage}

  # Lord, have mercy
  scope :search, -> search do
    if search.match /\A(-|\+)\s*(спо(.*)|бон(.*))/
      regexp = "-" + search.scan(/(спо(.*)|бон(.*))/).first[0]
    elsif search.match /\A(-|\+)\s*((\d)*)?\s*(сил|атак|эн|урон|жиз|жзн|жзн за урон|жизни за урон|)[а-я]*/
      mod = search.scan(/\A(-|\+)\s*/).first[0]
      mod = "\\+" if mod =~ /\+\s*/

      value = search.scan(/\d+/).first
      value == nil ? value = "(\\d)*" : value = value[0]

      effect = search.scan(/(сил|атак|эн|урон|жиз|жзн)/).first[0]
      effect = "(жзн|жизн)" if effect =~ /(жиз|жзн)/

      regexp = "#{mod}#{value} #{effect}"
      puts regexp
    elsif search.match /жизн(ь|ей|и|)? за урон/
      regexp = "жзн за урон"
    elsif search.match /эн(.*) за урон/
      regexp = "эн за урон"
    elsif search.match /(имб(.*))/ # Easter egg
      regexp = "(эхо: 2 яд(.*)|эхо: благо 2)"
    else
      regexp = search
    end

    where "ability ILIKE ? OR name ILIKE ? OR ability ~* ?", "%#{search}%", "%#{search}%", "#{regexp}"
  end

end
