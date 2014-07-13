ItemIndexController = Ember.ObjectController.extend

  actions:
    destroy: (item) ->
      item.destroyRecord()

`export default ItemIndexController`
