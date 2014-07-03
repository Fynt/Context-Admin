CreateItemRoute = Ember.Route.extend

  model: (params) ->
    extension = @store.find 'extension', slug: params.extension_slug
    .then (extensions) ->
      extensions.get 'firstObject'

    blueprint = @store.find 'blueprint', slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    Ember.RSVP.hash
      'extension': extension
      'blueprint': blueprint
      'item': @store.createRecord 'item'

`export default CreateItemRoute`
