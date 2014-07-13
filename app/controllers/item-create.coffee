ItemCreateController = Ember.ObjectController.extend

  actions:
    create: ->
      model = @get 'model'

      item = model.item
      blueprint = model.blueprint

      item.set 'blueprint', blueprint
      item.save()

`export default ItemCreateController`
