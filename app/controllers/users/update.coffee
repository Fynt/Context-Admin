UsersUpdateController = Ember.ObjectController.extend
  actions:
    update: ->
      model = @get 'model'
      model.save()

`export default UsersUpdateController`
