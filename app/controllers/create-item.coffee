CreateItemController = Ember.ObjectController.extend

  actions:
    create: ->
      model = @get 'model'
      console.log "CREATED " + model.blueprint.get 'name'

`export default CreateItemController`
