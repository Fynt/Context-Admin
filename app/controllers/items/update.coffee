ItemsUpdateController = Ember.ObjectController.extend

  actions:
    update: ->
      model = @get 'model'

      item = model.item
      blueprint = model.blueprint

      item.set 'blueprint', blueprint

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

      Ember.RSVP.allSettled(promises).then ->
        item.save()

`export default ItemsUpdateController`
