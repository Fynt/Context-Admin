ItemsUpdateController = Ember.ObjectController.extend

  actions:
    update: ->
      model = @get 'model'

      item = model.item
      blueprint = model.blueprint

      item.set 'blueprint', blueprint
      item.save()

`export default ItemsUpdateController`
