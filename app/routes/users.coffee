UsersRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'user'

`export default UsersRoute`
