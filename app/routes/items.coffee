ItemsRoute = Ember.Route.extend

  model: (params) ->
    blueprint = @store.find 'blueprint',
      extension: params.extension
      slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    items = @store.find @blueprints.get_type params.extension,
      params.blueprint_slug
    .then (items) ->
      items

    Ember.RSVP.hash
      extension: @store.findById 'extension', params.extension
      blueprint: blueprint
      items: items

`export default ItemsRoute`
