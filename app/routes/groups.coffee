GroupsRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'group'

`export default GroupsRoute`
