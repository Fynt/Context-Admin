GroupsCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'

      model.save()
      .then (model) =>
        @transitionToRoute 'groups'

`export default GroupsCreateController`
