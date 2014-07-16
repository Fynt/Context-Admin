UsersUpdateController = Ember.ObjectController.extend
  actions:
    update: ->
      model = @get 'model'
      user = model.user

      user.save()

`export default UsersUpdateController`
