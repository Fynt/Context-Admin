`import Ember from "ember"`
LoginView = Ember.View.extend
  didInsertElement: -> 
    # have to go two levels up to get to the application view because of the nested window component
    # so, if this breaks, it's likely referencing the wrong parent view
    @_applicationView().set('type', 'primary')
    # this also works, but feels awful...
    #Ember.$('.context-application').addClass('context-application-primary')
  willClearRender: ->
    @_applicationView().set('type', 'default')
  
  # I don't need any bindings for this, so I'm not making it a property
  _applicationView: ->
    console.log @get('parentView').get('parentView')
    @get('parentView').get('parentView')
    
`export default LoginView`