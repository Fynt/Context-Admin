CreateItemController = Ember.Controller.extend

  actions:
    create: ->
      model = @get 'model'
      console.log "CREATED " + model.blueprint

`export default CreateItemController`
