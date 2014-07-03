CreateItemController = Ember.ObjectController.extend

  actions:
    create: ->
      item = @get('model').item
      item.save()

`export default CreateItemController`
