UsersCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'
      user = model.user

      user.save()
      .then (user) =>
        @transitionToRoute 'users'

`export default UsersCreateController`
