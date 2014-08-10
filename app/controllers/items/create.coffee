ItemsCreateController = Ember.Controller.extend

  actions:
    create: ->
      model = @get 'model'

      item = model.item
      extension = model.extension
      blueprint = model.blueprint

      item.set 'blueprint', blueprint
      item.save()
      .then =>
        #TODO For whatever reason, this does not load the model hook in the
        # route, but I can't pass a string because there's two dynamic segments.
        @transitionToRoute 'items',
          extension: extension.id
          blueprint_slug: blueprint.get 'slug'

`export default ItemsCreateController`
