UsersIndexController = Ember.ObjectController.extend

  actions:
    destroy: (user) ->
      user.destroyRecord()

`export default UsersIndexController`
