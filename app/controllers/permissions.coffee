PermissionsController = Ember.Controller.extend
  action_types: [
    'view'
    'save'
    'publish'
    'destroy'
  ]

  actions:
    toggle: (group) ->
      console.log group

`export default PermissionsController`
