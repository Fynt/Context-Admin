UsersCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'

      model.save()
      .then (model) =>
        @transitionToRoute 'users'

`export default UsersCreateController`
