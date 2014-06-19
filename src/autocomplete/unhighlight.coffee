###
Unhighlights a suggestion
###

$ = require('jquery')

module.exports = (node) ->
  $(node).removeClass "active"
  @selected = false
  $(@ariaLive).empty()
