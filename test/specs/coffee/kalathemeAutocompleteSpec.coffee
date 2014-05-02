(($)->
  describe 'kalathemeAutocomplete', ->
    testInput = null
    testSandbox = null
    beforeEach ->
      testSandbox = sandbox()
      testInput = $('<input type="text" id="testInput" class="autocomplete"/>')
      .wrap('<div class="input-group"/>')
      testInput.after($('<span class="input-group-addon">').html('<span aria-hidden="true" class="fa fa-refresh"/>'))
      testSandbox.append testInput
      appendSetFixtures testSandbox
    describe 'the behaviour it modifies in core',  ->


      it 'attaches to Drupal behaviours', ->
        expect( Drupal.behaviors.autocomplete ).toBeDefined()
        window.testIntput = testInput


)(jQuery)
