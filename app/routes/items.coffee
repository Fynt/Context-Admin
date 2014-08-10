ItemsRoute = Ember.Route.extend

  model: (params) ->
    blueprint = @store.find 'blueprint',
      extension: params.extension
      slug: params.blueprint_slug
    .then (blueprints) ->
      blueprints.get 'firstObject'

    type_name = "#{params.extension}/#{params.blueprint_slug}"
    console.log "UGGHGHGH", @store.find type_name
    # items = @store.find type_name
    # .then (items) ->
    #   items

    Ember.RSVP.hash
      extension: @store.findById 'extension', params.extension
      blueprint: blueprint
      #items: items

`export default ItemsRoute`
