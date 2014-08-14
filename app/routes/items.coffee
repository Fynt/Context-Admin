ItemsRoute = Ember.Route.extend

  model: (params) ->
    list_fields = []

    blueprint = @store.find 'blueprint',
      extension: params.extension
      slug: params.blueprint_slug
    .then (blueprints) ->
      blueprint = blueprints.get 'firstObject'

      definition = blueprint.get 'definition'
      for field of definition
        options = definition[field].options || {}
        if options.show_in_list?
          list_fields.push field

      blueprint

    items = @store.find @blueprints.get_type params.extension,
      params.blueprint_slug
    .then (items) ->
      items

    Ember.RSVP.hash
      extension: @store.findById 'extension', params.extension
      blueprint: blueprint
      items: items
      list_fields: list_fields

`export default ItemsRoute`
