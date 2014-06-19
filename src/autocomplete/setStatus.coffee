$ = require('jquery')

module.exports = (status) ->
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
