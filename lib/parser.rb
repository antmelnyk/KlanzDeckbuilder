require 'nokogiri'
require 'action_controller'
require 'json'
require 'open-uri'

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

# 12 - enigma, 14 - gamblers, 22-25 - no clans
clan_id = [*1..11, 13, *15..21, 26, 27]
urls = []
cards =[]

clan_id.each_with_index { |digit, index| urls[index] = "http://www.klanz.ru/clans/#{digit}/original_cards" }

urls.each_with_index { |clan_page, index|
  clan_page = open(urls[index])
  doc = Nokogiri::HTML(clan_page)
  doc.css('.card').each do |card|
    id = card.at_css('.avatar-wrap').attributes['href'].value[/(\d*$)/]
    name = card.at_css('.name').inner_html.strip
    clan = clan_name(clan_id[index])
    rarity = card.attributes['class'].value[/common|rare|uniq|legend/]
    if name[/★/].nil?
      star = false
    else
      star = true
    end
    power = card.at_css('.power').inner_html
    damage = card.at_css('.damage').inner_html
    ability = card.at_css('.ability-wrap').at_css('div').inner_html.strip
    bonus = card.at_css('.bonus-wrap').at_css('div').inner_html.strip
    cards.push(
             card_id: id,
             name: name,
             clan: clan,
             rarity: rarity,
             star: star,
             power: power,
             damage: damage,
             ability: ability,
             bonus: bonus
    )
    puts JSON.pretty_generate(cards)
  end
}

File.open('cards.json','w') do |f|
  f.write(JSON.pretty_generate(cards))
end
