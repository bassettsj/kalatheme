###*
* @file
* Overrides for core autocomplete themeing.
*
* Thanks bootstrap theme for insperation
* @link https://drupal.org/project/bootstrap
###

Drupal = require('drupal')

Drupal.jsAC ?= ->

Drupal.behaviors.autocomplete = require('./behaviours.coffee')

Drupal.autocompleteSubmit =require('./submit.coffee')

Drupal.jsAC::highlight = require('./highlight.coffee')

Drupal.jsAC::unhighlight = require('./unhighlight.coffee')

Drupal.jsAC::populatePopup = require('./populatePopup.coffee')

Drupal.jsAC::found = require('./found.coffee')

Drupal.jsAC::setStatus = require('./setStatus.coffee')
