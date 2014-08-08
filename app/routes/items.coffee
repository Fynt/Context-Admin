ItemsRoute = Ember.Route.extend

  model: (params) ->
    blueprint = @store.find 'blueprint',
      extension: params.extension
      slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    type_name = "#{params.extension}#{params.blueprint_slug}"
    items = @store.find type_name

    Ember.RSVP.hash
      extension: @store.findById 'extension', params.extension
      blueprint: blueprint
      items: items

`export default ItemsRoute`
