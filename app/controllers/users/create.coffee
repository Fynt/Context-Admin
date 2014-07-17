UsersCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'
      user = model.user

      console.log user.get 'group_id'
      #TODO Set the group

      user.save()
      .then (user) =>
        @transitionToRoute 'users'

`export default UsersCreateController`
