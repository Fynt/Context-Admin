GroupsIndexController = Ember.ObjectController.extend

  actions:
    destroy: (group) ->
      group.destroyRecord()

`export default GroupsIndexController`
