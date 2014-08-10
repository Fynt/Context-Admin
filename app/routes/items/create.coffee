ItemsCreateRoute = Ember.Route.extend

  model: (params) ->
    items_model = @modelFor 'items'
    extension = items_model.extension
    blueprint = items_model.blueprint

    form = @blueprints.get_form extension.id, blueprint.get 'slug'

    blueprint_slug = blueprint.get 'slug'
    type_name = "#{extension.id}/#{blueprint_slug}"

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      item: @store.createRecord type_name
      form: form

`export default ItemsCreateRoute`
