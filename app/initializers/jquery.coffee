JqueryInitializer =
  name: 'jquery'

  initialize: ->
    Ember.$.ajaxSetup
      xhrFields:
        withCredentials: true

`export default JqueryInitializer`
