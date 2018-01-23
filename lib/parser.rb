# Due to login and collection mechanics rework in order to extract collection data a new approach is required!

require 'watir'
require 'selenium-webdriver'
require 'chromedriver/helper'
require 'open-uri'
require 'fileutils'

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
      21 => 'Toyz',
      26 => 'Nemos',
      27 => 'SymBio'
  }

  clans[clan_id]
end

def parse_page(browser, cards)

  browser.div(:id, 'collection_cards').divs(:class, 'card').each do |card|
    id = card.attribute_value('data-id')
    name = card.div(:class, 'name').span.inner_html
    clan = clan_name card.div(:class, 'bg-clan-icon-wrap').img.attribute_value('src')[/(\d+)/].to_i
    rarity = card.attribute_value('class')[/common|rare|uniq|legend/]
    star = name[/★/].nil? ? false : true
    power = card.div(:class, 'name').div(:class, 'power').inner_html
    damage = card.div(:class, 'name').div(:class, 'damage').inner_html
    ability = card.div(:class, 'ability-wrap').div(:class, 'value').inner_html
    bonus = card.div(:class, 'bonus-wrap').div(:class, 'value').inner_html
    art_link = card.a(:class, 'avatar-wrap').img.attribute_value('src')

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

    p name + ' parsed'

    # Download Art
    # ======================================================================================================

    art = open art_link
    bytes_expected = art.meta['content-length'].to_i
    place = Dir.pwd + '/temp'

    bytes_copied = IO.copy_stream art, place

    puts "Art #{id} downloaded! Yay!" if bytes_expected == bytes_copied

    File.open('temp', 'rb').read.include?('PNG') ?
        FileUtils.mv('temp', File.expand_path("..", Dir.pwd) + "/app/assets/images/cards_png/#{id}.png")
        : FileUtils.mv('temp', File.expand_path("..", Dir.pwd) + "/app/assets/images/cards_jpg/#{id}.jpg")
    puts "Art calibrated! Moving on!"
  end

  current_page = browser.div(:class, 'page current')

  p 'Page #' + current_page.a.inner_html + ' parsed. Moving to the next!'

  next_page = browser.div(:class => 'page', :text => "#{current_page.a.inner_html.to_i + 1}")

  if next_page.present?
    next_page.click
    while browser.div(:class, 'page current').a.inner_html != next_page.a.inner_html do
      sleep 1
    end
    parse_page browser, cards
  else
    p 'Card parsing is complete'

    File.open('cards.json','w') do |f|
      f.write(JSON.pretty_generate(cards))
    end
  end
end

# Go to Klanz, log in, go to Collection, parse every card on the page, do that for every page
browser = Watir::Browser.new
browser.goto 'https://www.klanz.ru/'
browser.div(:class, 'link-to-step-registered').a.click
browser.text_field(:id, 'registered_user_login').set('Insomniaс')
browser.text_field(:id, 'registered_user_password').set('delikates')
browser.div(:id, 'step-registered').input(:type, 'button').click

browser.li(:id, 'menu_item_collection').a.click

cards = []

parse_page browser, cards
