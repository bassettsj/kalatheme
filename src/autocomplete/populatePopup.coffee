###
Positions the suggestions popup and starts a search.
###
module.exports = ->
  $input = $(@input)

  # Show popup.
  $(@popup).remove()  if @popup
  @selected = false
  @popup = $("<div class=\"dropdown\"></div>")[0]
  @popup.owner = this
  $input.parent().after @popup

  # Do search.
  @db.owner = this
  @db.search @input.value
