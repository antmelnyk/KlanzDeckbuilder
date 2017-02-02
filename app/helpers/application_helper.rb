module ApplicationHelper

  def card_path(id)
    return "cards_jpg/#{id}.jpg" if File.file? (Rails.root +
        "app/assets/images/cards_jpg/#{id}.jpg")
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

  def get_clans(deck)
    result = []
    get_cards(deck).each do |card|
      unless result.include? card.clan
        result << card.clan
      end
    end
    result
  end

  def clan_id(clan_name)
    clans = {
        1 => 'Micron',
        2 => 'Aliens',
        3 => 'Street',
        4 => 'Mafia',
        5 => 'Circus',
        6 => '[Da:Hack]',
        7 => 'Alpha',
        8 => 'Fury',
        9 => 'Deviants',
        10 => 'Damned',
        11 => 'Saints',
        13 => 'Metropolis',
        15 => 'Workers',
        16 => 'PSI',
        17 => 'Kingpin',
        18 => 'Chasers',
        19 => 'Халифат',
        20 => 'C.O.R.R',
        21 => 'Toyz',
        26 => 'Nemos',
        27 => 'SymBio'
    }
    clans.key(clan_name)
  end

  def clan_name(clan_id)
    clans = {
        1 => 'Micron',
        2 => 'Aliens',
        3 => 'Street',
        4 => 'Mafia',
        5 => 'Circus',
        6 => '[Da:Hack]',
        7 => 'Alpha',
        8 => 'Fury',
        9 => 'Deviants',
        10 => 'Damned',
        11 => 'Saints',
        13 => 'Metropolis',
        15 => 'Workers',
        16 => 'PSI',
        17 => 'Kingpin',
        18 => 'Chasers',
        19 => 'Халифат',
        20 => 'C.O.R.R',
        21 => 'Toyz',
        26 => 'Nemos',
        27 => 'SymBio'
    }
    clans.invert.key(clan_id)
  end

  def clan_id_range
    [*1..11, 13, *15..21, 26, 27]
  end

  def rarities
    %w[common rare uniq legend]
  end

  protected
  def safe_params
    params.except(:host, :port, :protocol).permit!
  end

end
