###
Prevents the form from submitting if the suggestions popup is open
and closes the suggestions popup when doing so.
###

$ = require('jquery')
module.exports = ->
  $(".form-autocomplete > .dropdown").each(->
    @owner.hidePopup()

  ).length is 0
