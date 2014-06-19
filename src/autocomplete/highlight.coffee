###
Highlights a suggestion.
###
$ = require('jquery')
module.exports = (node) ->
  $(@selected).removeClass "active"  if @selected
  $(node).addClass "active"
  @selected = node
  $(@ariaLive).html $(@selected).html()
