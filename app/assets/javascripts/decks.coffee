$(document).ready ->
  $(document).on "click", "tr[data-link]", ->
    window.location = $(this).data('link')
    return