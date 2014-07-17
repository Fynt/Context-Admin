UsersUpdateController = Ember.ObjectController.extend
  actions:
    update: ->
      model = @get 'model'
      user = model.user

      console.log user.get 'group_id'
      #TODO Set the group

      user.save()

`export default UsersUpdateController`
