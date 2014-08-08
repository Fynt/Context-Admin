ItemsCreateRoute = Ember.Route.extend

  model: (params) ->
    items_model = @modelFor 'items'
    extension = items_model.extension
    blueprint = items_model.blueprint

    form = @blueprints.get_form extension.id, blueprint.get 'slug'
    .then (form) ->
      form

    item = @blueprints.get_item @store.modelFor('item'), extension.id,
      blueprint.get 'slug'
    .then (item) =>
      @store.createRecord item

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      item: item
      form: form

`export default ItemsCreateRoute`