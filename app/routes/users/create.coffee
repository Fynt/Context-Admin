UsersCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'user'

`export default UsersCreateRoute`
