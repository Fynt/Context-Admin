`import Ember from "ember"`
GroupsCreateController = Ember.ObjectController.extend
  actions:
    create: ->
      model = @get 'model'

      model.save()
      .then (group) =>
        @transitionToRoute 'groups.update', group

`export default GroupsCreateController`
