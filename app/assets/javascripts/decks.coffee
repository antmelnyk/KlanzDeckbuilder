$(document).ready ->
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
