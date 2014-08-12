`import Ember from "ember"`
UsersUpdateController = Ember.ObjectController.extend
  actions:
    update: ->
      model = @get 'model'
      user = model.user

      @store.findById 'group', user.get 'group_id'
      .then (group) ->
        user.set 'group', group
        user.save()

`export default UsersUpdateController`
