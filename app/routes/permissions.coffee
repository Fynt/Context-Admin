PermissionsRoute = Ember.Route.extend

  model: ->
    Ember.RSVP.hash
      extensions: @store.find 'extension'

`export default PermissionsRoute`
