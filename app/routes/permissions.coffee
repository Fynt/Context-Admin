PermissionsRoute = Ember.Route.extend
  model: ->
    @store.find 'permission'

`export default PermissionsRoute`
