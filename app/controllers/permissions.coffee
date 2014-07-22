PermissionsController = Ember.Controller.extend
  action_types:
    view: 'View'
    save: 'Save'
    publish: 'Publish'
    destroy: 'Destroy'

  actions:
    update: (group) ->
      console.log group

`export default PermissionsController`
