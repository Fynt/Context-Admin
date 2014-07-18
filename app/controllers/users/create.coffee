UsersCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'
      user = model.user

      @store.findById 'group', user.get 'group_id'
      .then (group) =>
        user.set 'group', group

        user.save()
        .then (user) =>
          # Oh, ember. We need to just send the id, otherwise the model hook on
          # the controller won't get called.
          @transitionToRoute 'users.update', user.get 'id'


`export default UsersCreateController`
