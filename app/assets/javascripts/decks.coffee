# Simple class for controlling cards in deck
class Deck
  constructor: ->
    @head = -1
    @cards = []

  add_card: (card) =>
    if card in @cards
      alert('Дубли в деке запрещены клерками!')
      return false
    else
      @cards.push card
      @head++
      if @head > 13
        $(':input[type="submit"]').prop('disabled', false)
      return true

  remove_card: (bad_card) =>
    @cards = @cards.filter (card) -> card isnt bad_card
    @head--
    if @head < 14
      $(':input[type="submit"]').prop('disabled', true)


$(document).ready ->
  $('#create-deck').prop('disabled', true)
  deck = new Deck()
  deck_input = ''

  # When clicked on outdeck-card: add card id to the hidden input in form_for,
  # then toggle classes inside card divs into dockholdered classes,
  # detach card and append to the deckholder. Next function vice versa.
  $(document).on "click", ".outdeck-card", ->
    card = $(this).attr('id')
    deckable = deck.add_card card
    if deckable
      deck_input = $('input[name="deck[deck]"]')[0].value = deck_input + card + '_'
      $(this).removeClass('outdeck-card')
      $(this).addClass('deck-card')
      toggle_to_deckholder($(this))
      $(this).detach().fadeIn('fast')
      $('.deckholder').append($(this))

  $(document).on "click", ".deck-card", ->
    deck_input = $('input[name="deck[deck]"]')[0].value
    id_to_remove = $(this).attr('id') + '_'
    deck_input = deck_input.replace id_to_remove, ''
    $('input[name="deck[deck]"]').val(deck_input)

    chosen = $(this).attr('id')
    deck.remove_card(chosen)
    $(this).removeClass('deck-card')
    $(this).addClass('outdeck-card')
    toggle_to_list($(this))
    $(this).detach().fadeIn('fast')
    $('#cards').append($(this))

  # "Clearing" deck by reloading page, rofl
  $(document).on "click", "#clear-all", ->
    location.reload()

  # Helper functions (to toggle classes vice versa)
  toggle_to_deckholder = (card) ->
# Append power/damage to card name for deckholder cards
    power = card.find($('.power')).text()
    damage = card.find($('.damage')).text()
    card.find($('.name')).append(' : ' + power + '/' + damage)
    card.find($('.long-name')).append(' : ' + power + '/' + damage)

    # Toggling deckholder classes
    card.find($('.art')).toggleClass('deckholder-art art')
    card.find($('.main-line')).toggleClass('deckholder-main-line main-line')
    card.find($('.power-bg')).toggleClass('deckholder-power-bg power-bg')
    card.find($('.power')).toggleClass('deckholder-power power')
    card.find($('.damage-bg')).toggleClass('deckholder-damage-bg damage-bg')
    card.find($('.damage')).toggleClass('deckholder-damage damage')
    card.find($('.stats')).toggleClass('deckholder-stats stats')
    card.find($('.ability')).toggleClass('deckholder-ability ability')
    card.find($('.long-ability')).toggleClass('deckholder-long-ability long-ability')
    card.find($('.name')).toggleClass('deckholder-name name')
    card.find($('.long-name')).toggleClass('deckholder-long-name long-name')
    card.find($('.bonus')).toggleClass('deckholder-bonus bonus')

  toggle_to_list = (card) ->
# Getting back card name without power-damage text
    namestats = card.find($('.deckholder-name')).text().replace(/\s/g, '')
    namestats_long = card.find($('.deckholder-long-name')).text().replace(/\s/g, '')
    name = namestats.slice(0, -4).replace('★', ' ★')
    name_long = namestats_long.slice(0, -4).replace('★', ' ★')
    card.find($('.deckholder-name')).empty().append(name)
    card.find($('.deckholder-long-name')).empty().append(name_long)

    # Toggling deckholder classes
    card.find($('.deckholder-art')).toggleClass('art deckholder-art')
    card.find($('.deckholder-main-line')).toggleClass('main-line deckholder-main-line')
    card.find($('.deckholder-power-bg')).toggleClass('power-bg deckholder-power-bg')
    card.find($('.deckholder-power')).toggleClass('power deckholder-power')
    card.find($('.deckholder-damage-bg')).toggleClass('damage-bg deckholder-damage-bg')
    card.find($('.deckholder-damage')).toggleClass('damage deckholder-damage')
    card.find($('.deckholder-stats')).toggleClass('stats deckholder-stats')
    card.find($('.deckholder-ability')).toggleClass('ability deckholder-ability')
    card.find($('.deckholder-long-ability')).toggleClass('long-ability deckholder-long-ability')
    card.find($('.deckholder-long-name')).toggleClass('long-name deckholder-long-name')
    card.find($('.deckholder-name')).toggleClass('name deckholder-name')
    card.find($('.deckholder-bonus')).toggleClass('bonus deckholder-bonus')

  $(document).on "click", "#deck-info-label", ->
    $('#deck_info').slideToggle('slow')

  # Show 'loading cards' indicator
  $('#loading').hide()
  $(document).ajaxStart(->
    $('#loading').show()
    return
  ).ajaxStop ->
    $('#loading').hide()
    return


