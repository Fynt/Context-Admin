UsersUpdateRoute = Ember.Route.extend

  model: (params) ->
    Ember.RSVP.hash
      groups: @store.find 'group'
      user: @store.findById 'user', params.user_id

`export default UsersUpdateRoute`
