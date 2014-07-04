CreateItemRoute = Ember.Route.extend

  model: (params) ->
    extension = @store.find 'extension', slug: params.extension_slug
    .then (extensions) ->
      extensions.get 'firstObject'

    blueprint = @store.find 'blueprint', slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    form = @blueprints.get_form params.extension_slug, params.blueprint_slug
    .then (form) ->
      form
    , (error) ->
      console.log error

    Ember.RSVP.hash
      extension: extension
      blueprint: blueprint
      item: @store.createRecord 'item'
      form: form

`export default CreateItemRoute`
