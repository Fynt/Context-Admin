CreateItemController = Ember.ObjectController.extend

  actions:
    create: ->
      model = @get 'model'
      console.log model.test

`export default CreateItemController`
