ItemsCreateRoute = Ember.Route.extend

  model: (params) ->
    items_model = @modelFor 'items'
    extension = items_model.extension
    blueprint = items_model.blueprint

    form = @blueprints.get_form blueprint

    type_name = @blueprints.get_type extension.id, blueprint.get 'slug'

    model_data =
      extension: extension
      blueprint: blueprint
      item: @store.createRecord type_name
      form: form

    definition = blueprint.get 'definition'
    for field of definition
      options = definition[field]

      if options.belongs_to?
        relationship = Ember.Inflector.inflector.pluralize field
        related_type = @blueprints.get_type extension.id, field

        model_data[relationship] = @store.find related_type

    Ember.RSVP.hash model_data

`export default ItemsCreateRoute`
