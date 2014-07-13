ItemUpdateRoute = Ember.Route.extend

  model: (params) ->
    extension = @store.find 'extension', slug: params.extension_slug
    .then (extensions) ->
      extensions.get 'firstObject'

    blueprint = @store.find 'blueprint',
      extension: params.extension_slug
      slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    form = @blueprints.get_form params.extension_slug, params.blueprint_slug
    .then (form) ->
      form

    item = @blueprints.get_item @store.modelFor('item'), params.extension_slug,
      params.blueprint_slug
    .then (item) =>
      @store.findById item, params.id

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      item: item
      form: form

`export default ItemUpdateRoute`
