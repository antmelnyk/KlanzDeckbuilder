require 'nokogiri'
require 'action_controller'
require 'json'
require 'open-uri'

# Downloads all arts in .jpg, however there are some .png cards and even .gif one
# Can be really improved
def download_art(art_link, id)
  sleep(0.3)
  art = open "http://www.klanz.ru#{art_link}"

  bytes_expected = art.meta['content-length'].to_i
  bytes_copied = IO.copy_stream art, "arts/#{id}.jpg" #png starts with 0x89 0x50

  if bytes_expected == bytes_copied
    puts "Art #{id} downloaded! Yay!"
  else
    puts 'Megatron joke or connection problem?..'
    raise 'ERROR'
  end

  rescue
    retry

end

# Downloads all clans background logo for clans
def download_clan_background_logo(id)
  logo = open "http://klanz.ru/images/clans/#{id}/background_logo.png"
  IO.copy_stream logo, "logos/#{id}.png"
  puts "Logo #{id} downloaded, yay!"
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
  clans.invert.key(clan_id) # Whatever
end

# 12 - enigma, 14 - gamblers, 22-25 - no clans
clan_id = [*1..11, 13, *15..21, 26, 27]
urls = []
cards = []

# For every clan visit page, take all cards data and push to cards array,
# then write array in JSON format into cards.json

clan_id.each_with_index do |digit, index|
  urls[index] = "http://www.klanz.ru/clans/#{digit}/original_cards"
  # download_clan_background_logo(digit)
end

urls.each_with_index do |clan_page, index|
  clan_page = open urls[index]
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
             number: id,
             name: name,
             clan: clan,
             rarity: rarity,
             star: star,
             power: power,
             damage: damage,
             ability: ability,
             bonus: bonus
    )
    # art_link = card.at_css('.avatar-wrap').at_css('img').attributes['src']
    # download_art art_link, id
    puts "#{name} is downloaded!"
  end
end

File.open('cards.json','w') do |f|
  f.write(JSON.pretty_generate(cards))
end
