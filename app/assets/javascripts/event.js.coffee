$ ->
  activeField = undefined # Init to empty
  $('#event_submit').on 'click', ->
    # Get the event form
    eventForm = $('#event_form>form')
    eventForm.submit

