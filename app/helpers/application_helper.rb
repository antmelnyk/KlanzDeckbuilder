module ApplicationHelper

  def card_path(id)
    return "cards_jpg/#{id}.jpg" if File.file? (Rails.root +
        "app/assets/images/cards_jpg/#{id}.jpg")
    return "cards_jpg/#{id}.jpg" if File.file? (Rails.root +
        "app/assets/images/cards_jpg/#{id}") # should be no extension jpg
    return "cards_png/#{id}.png" if File.file? (Rails.root +
        "app/assets/images/cards_png/#{id}.png")
    "#{id}.gif"
  end

  def get_cards(deck)
    result = []
    card_list = []
    cards = deck.deck.split /_/
    cards.each { |card| card_list << card.to_i }
    card_list.each { |card| result << Card.where(number: card).take }
    result
  end
end
