ItemsUpdateRoute = Ember.Route.extend

  model: (params) ->
    items_model = @modelFor 'items'
    extension = items_model.extension
    blueprint = items_model.blueprint

    form = @blueprints.get_form extension.id, blueprint.get 'slug'

    type_name = @blueprints.get_type extension.id, blueprint.get 'slug'

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      item: @store.findById type_name, params.id
      form: form

`export default ItemsUpdateRoute`
