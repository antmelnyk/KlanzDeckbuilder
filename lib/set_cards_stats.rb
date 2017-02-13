Card.all.each do |card|
  if card.ability = '−способность'
    card.ability = '-способность'
  elsif card.ability = '−бонус'
    card.ability = '-бонус'
  end
  card.save
end