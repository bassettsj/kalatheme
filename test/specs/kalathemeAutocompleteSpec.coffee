module.exports = ->
  $ = require('jquery')
  require('../../src/autocomplete/index.coffee')
  describe 'autocomplete module', ->
    testInput = null
    testSandbox = null
    testHidden = null
    window._testObjs  ?= {}

    beforeEach ->
      testSandbox = $('<form/>')
      testInput = $('<input type="text" id="testInput" />')
      testSandbox.append(testInput)
      testHidden = $('<input type="hidden" id="testHidden"
      value="http://null.com" disabled="disabled" class="autocomplete">')
      testSandbox.append(testHidden)
      testInput.wrap('<div class="input-group"/>').after(
        $('<span class="input-group-addon"/>')
        .html('<span aria-hidden="true" class="fa fa-refresh"/>')
      )
      _testObjs.testAutocomplete = testSandbox
      appendSetFixtures testSandbox
    describe 'it Attaches it to the Drupal.behviours object',  ->


      it 'attaches to Drupal behaviours and runs on load', ->

        expect( Drupal.behaviors.autocomplete ).toBeDefined()
        #@todo get this thing going
