CreateItemController = Ember.ObjectController.extend

  actions:
    create: ->
      item_data = @get('model').item_data
      item = @store.createRecord 'test'

      # Apply post item_data to item.
      for key of item_data
        if item_data.hasOwnProperty key
          item.set key, item_data[key]

      item.save()

`export default CreateItemController`
