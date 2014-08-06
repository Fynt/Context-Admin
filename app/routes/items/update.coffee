ItemsUpdateRoute = Ember.Route.extend

  model: (params) ->
    items_model = @modelFor 'items'
    extension = items_model.extension
    blueprint = items_model.blueprint

    form = @blueprints.get_form extension.id, blueprint.get 'slug'
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

`export default ItemsUpdateRoute`
