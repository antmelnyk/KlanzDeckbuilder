[171, 733, 1142, 501, 787].each do |card|
   c = Card.find(card)
   c.marketable = false
   c.save
end
