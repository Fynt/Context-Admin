UsersCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'
      user = model.user

      @store.findById 'group', user.get 'group_id'
      .then (group) ->
        user.set 'group', group

        user.save()
        .then (user) =>
          @transitionToRoute 'users'


`export default UsersCreateController`
