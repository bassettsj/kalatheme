###
Fills the suggestion popup with any matches received.
###
module.exports = (matches) ->

  # If no value in the textfield, do not show the popup.
  return false  unless @input.value.length

  # Prepare matches.
  ul = $("<ul class=\"dropdown-menu\" role=\"menu\"></ul>")
  ac = this
  ul.css
    display: "block"
    right: 0

  for key of matches
    $("<li role=\"presentation\"></li>")
    .html($("<a href=\"#\" role=\"menuitem\"/>")
    .html(matches[key]).click((e) ->
      e.preventDefault()
    )).mousedown(->
      ac.select this
    ).mouseover(->
      ac.highlight this
    ).mouseout(->
      ac.unhighlight this
    ).data("autocompleteValue", key).appendTo ul

  # Show popup with matches, if any.
  if @popup
    if ul.children().length
      $(@popup).empty().append(ul).show()
      $(@ariaLive).html Drupal.t("Autocomplete popup")
    else
      $(@popup).css visibility: "hidden"
      @hidePopup()
