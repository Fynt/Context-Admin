PermissionsRoute = Ember.Route.extend

  model: (params) ->
    Ember.RSVP.hash
      extensions: @store.find 'extension'
      group: @store.findById 'group', params.group_id

`export default PermissionsRoute`
