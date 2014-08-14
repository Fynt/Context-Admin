ItemsCreateRoute = Ember.Route.extend

  model: (params) ->
    items_model = @modelFor 'items'
    extension = items_model.extension
    blueprint = items_model.blueprint

    form = @blueprints.get_form blueprint

    type_name = @blueprints.get_type extension.id, blueprint.get 'slug'

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      item: @store.createRecord type_name
      form: form

`export default ItemsCreateRoute`
