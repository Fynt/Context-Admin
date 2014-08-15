ItemsCreateController = Ember.ObjectController.extend

  actions:
    create: ->
      model = @get 'model'

      item = model.item
      extension = model.extension
      blueprint = model.blueprint

      item.set 'blueprint', blueprint

      # Looping over relationships so we can set the values from the form.
      #TODO There has to be an easier way.
      promises = []
      item.eachRelationship (field, relationship) =>
        field_key = "#{field}_id"
        if item.get field_key
          id = item.get field_key
          type_key = relationship.type.typeKey

          promise = @store.findById(type_key, id)
          .then (result) ->
            item.set field, result
          promises.push promise

      Ember.RSVP.allSettled(promises).then =>
        item.save().then =>
          @transitionToRoute 'items.update',
            extension: extension.id
            blueprint_slug: blueprint.get 'slug'
            id: item.id

`export default ItemsCreateController`
