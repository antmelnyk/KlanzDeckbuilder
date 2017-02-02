# Organizing nice 'cards loading' indicator display
$(document).ready ->
  $('#cards').fadeIn(1000)
  $('#loader').hide()
  $(document).ajaxStart(->
    $('#cards').hide()
    $('.bottom-line').hide()
    $('#loader').fadeIn()
    return
  ).ajaxStop ->
    $('#loader').fadeOut()
    $('#cards').show()
    $('.bottom-line').show()
    return