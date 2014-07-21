PermissionsRoute = Ember.Route.extend

  model: ->
    Ember.RSVP.hash
      groups: @store.find 'group'

`export default PermissionsRoute`
