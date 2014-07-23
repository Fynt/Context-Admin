PermissionsController = Ember.Controller.extend
  action_types: [
    'view'
    'save'
    'publish'
    'destroy'
  ]

  actions:
    toggle_extension: (extension, action='view') ->
      console.log extension, action

    toggle_blueprint: (blueprint, action='view') ->
      console.log blueprint, action

`export default PermissionsController`
