###*
* @file src/autocomplete/autocomplete-behaviours.coffee
* Attaches it to the Drupal object.
###

###*
*Attaches the autocomplete behavior to all required fields.
###

$ = require('jquery')
Drupal = require('drupal')
attach = (context, settings) ->
  acdb = []
  $("input.autocomplete", context).once "autocomplete", ->
    uri = @value
    acdb[uri] = new Drupal.ACDB(uri)  unless acdb[uri]
    $input = $("#" + @id.substr(0, @id.length - 13))
    .attr("autocomplete", "OFF")
    .attr("aria-autocomplete", "list")
    $($input[0].form).submit Drupal.autocompleteSubmit
    ariaLive = $("<span class=\"element-invisible\" aria-live=\"assertive\"/>")
    .attr("id", "#{$input.attr("id")}-autocomplete-aria-live")
    $input.after
    $input.parent().parent().attr "role", "application"
    new Drupal.jsAC($input, acdb[uri])



module.exports = ->
  return {
    attach: attach
  }
