# This initializer exists so we have a logical hook to set up some defaults for
# jquery.
JqueryInitializer =
  name: 'jquery'

  initialize: ->
    Ember.$.ajaxSetup
      # The following allows the user session cookie to be sent with CORS
      # requests.
      xhrFields:
        withCredentials: true

`export default JqueryInitializer`
