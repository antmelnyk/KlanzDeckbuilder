[1781, 1779, 1771].each do |card|
   c = Card.find_by(number: card)
   c.marketable = false
   c.save
end
