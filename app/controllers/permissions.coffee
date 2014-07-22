PermissionsController = Ember.Controller.extend
  action_types: [
    'view'
    'save'
    'publish'
    'destroy'
  ]

  actions:
    update: (group) ->
      console.log group

`export default PermissionsController`
