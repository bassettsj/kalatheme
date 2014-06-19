###*
* @file
* Overrides for core autocomplete themeing.
*
* Thanks bootstrap theme for insperation
* @link https://drupal.org/project/bootstrap
###
$ = require('jquery')
Drupal = require('drupal')

Drupal.jsAC ?= ->

Drupal.behaviors.autocomplete = require('./autocomplete-behaviours.coffee')




###
Prevents the form from submitting if the suggestions popup is open
and closes the suggestions popup when doing so.
###

Drupal.autocompleteSubmit = ->
  $(".form-autocomplete > .dropdown").each(->
    @owner.hidePopup()

  ).length is 0


###
Highlights a suggestion.
###
Drupal.jsAC::highlight = (node) ->
  $(@selected).removeClass "active"  if @selected
  $(node).addClass "active"
  @selected = node
  $(@ariaLive).html $(@selected).html()



###
Unhighlights a suggestion.
###
Drupal.jsAC::unhighlight = (node) ->
  $(node).removeClass "active"
  @selected = false
  $(@ariaLive).empty()



###
Positions the suggestions popup and starts a search.
###
Drupal.jsAC::populatePopup = ->
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
  return


###
Fills the suggestion popup with any matches received.
###
Drupal.jsAC::found = (matches) ->

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

Drupal.jsAC::setStatus = (status) ->
  fontAwesome = if Drupal.settings.kalatheme.fontawesome then true else false
  iconSpin = if fontAwesome then 'fa-spin' else 'glyphicon-spin'
  $throbber = $(
    ".fa-refresh, .glyphicon-refresh, .autocomplete-throbber",
    $("#" + @input.id).parent()
    ).first()
  throbbingClass = (if $throbber.is(".autocomplete-throbber") then "throbbing" else iconSpin)
  switch status
    when "begin"
      $throbber.addClass throbbingClass
      $(@ariaLive).html Drupal.t("Searching for matches...")
    when "cancel", "error", "found"
      $throbber.removeClass throbbingClass
