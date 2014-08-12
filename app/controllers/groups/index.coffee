`import Ember from "ember"`
GroupsIndexController = Ember.ObjectController.extend

  actions:
    destroy: (group) ->
      group.destroyRecord()

`export default GroupsIndexController`
