CreateItemController = Ember.ObjectController.extend

  actions:
    create: ->
      item_data = @get('model').item_data
      item = {}

      # Apply post item_data to item.
      for key of item_data
        if item_data.hasOwnProperty key
          item[key] = item_data[key]

      record = @store.createRecord 'test', item
      record.save() #TODO Is save even needed here?

`export default CreateItemController`
