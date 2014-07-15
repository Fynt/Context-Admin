UsersUpdateController = Ember.ObjectController.extend
  actions: 
    update: ->
      model = @get 'model'
      console.log model

`export default UsersUpdateController`
