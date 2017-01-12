require 'nokogiri'
require 'action_controller'
require 'json'
require 'open-uri'

  def clan_name(clan_id)
    case clan_id
      when 1 then return 'Micron'
      when 2 then return 'Aliens'
      when 3 then return 'Street'
      when 4 then return 'Mafia'
      when 5 then return 'Circus'
      when 6 then return '[Da:Hack]'
      when 7 then return 'Alpha'
      when 8 then return 'Fury'
      when 9 then return 'Deviants'
      when 10 then return 'Damned'
      when 11 then return 'Saints'
      when 13 then return 'Metropolis'
      when 15 then return 'Workers'
      when 16 then return 'PSI'
      when 17 then return 'Kingpin'
      when 18 then return 'Chasers'
      when 19 then return 'Халифат'
      when 20 then return 'C.O.R.R'
      when 21 then return 'Toyz'
      when 26 then return 'Nemos'
      when 27 then return 'SymBio'
    end
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
    # puts JSON.pretty_generate(cards)
  end
}

File.open('cards.json','w') do |f|
  f.write(JSON.pretty_generate(cards))
end
