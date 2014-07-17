IndexRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'history'

`export default IndexRoute`
