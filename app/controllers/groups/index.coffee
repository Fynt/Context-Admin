`import Ember from "ember"`
GroupsIndexController = Ember.ObjectController.extend
  needs: ['application']
  actions:
    destroy: (group) ->
      group.destroyRecord()

`export default GroupsIndexController`
