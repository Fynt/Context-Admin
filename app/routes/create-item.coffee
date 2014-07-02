CreateItemRoute = Ember.Route.extend

  model: (params) ->
    extension: @store.find('extension', slug: params.extension_slug)
    blueprint: @store.find('blueprint', slug: params.extension_slug)

`export default CreateItemRoute`
