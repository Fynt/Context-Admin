ItemsRoute = Ember.Route.extend

  model: (params) ->
    extension = @store.find 'extension', slug: params.extension_slug
    .then (extensions) ->
      extensions.get 'firstObject'

    blueprint = @store.find 'blueprint',
      extension: params.extension_slug
      slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    items = @blueprints.get_item @store.modelFor('item'), params.extension_slug,
      params.blueprint_slug
    .then (type) =>
      @store.find type,
        extension: params.extension_slug
        blueprint_slug: params.blueprint_slug

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      items: items

`export default ItemsRoute`
