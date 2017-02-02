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
    if $('#cards').find('.card').length == 0
      $('#cards').append("<span>Нет карт соответствующих заданному фильтру!</span>").hide().fadeIn()
    return
