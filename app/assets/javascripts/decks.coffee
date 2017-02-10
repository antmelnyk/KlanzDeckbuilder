$(document).ready ->
  $('#decks-loader').hide()
  $(document).on "click", "tr[data-link]", ->
    window.location = $(this).data('link')
    return

  setTooltip = (btn, message) ->
    $(btn).tooltip('hide').attr('data-original-title', message).tooltip 'show'
    return

  hideTooltip = (btn) ->
    setTimeout (->
      $(btn).tooltip 'hide'
      return
    ), 2000
    return

  $('.clipboard-btn').tooltip
    trigger: 'click'
    placement: 'top'

  clipboard = new Clipboard('.clipboard-btn')
  clipboard.on 'success', (e) ->
    setTooltip e.trigger, 'Ссылка скопирована!'
    hideTooltip e.trigger
    return

  $(document).ajaxStart(->
    $('#decks-loader').fadeIn()
    $('.decks-table').hide()
    $('#decks-paginator').hide()
    return
  ).ajaxStop ->
      $('#decks-loader').fadeOut()
      $('.decks-table').fadeIn()
      $('#decks-paginator').fadeIn()
      if $('.decks-table').find('.deck-row').length == 0
        $('#no-results').append("<span id='no-result'>Ни одной деки не найдено. Или она еще не создана или у вас неккоректный запрос!</span>")
        $('#no-results').hide().fadeIn()
      return
