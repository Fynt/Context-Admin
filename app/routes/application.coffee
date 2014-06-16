ApplicationRoute = Ember.Route.extend
  model: ->
    @store.find('extension')

`export default ApplicationRoute`