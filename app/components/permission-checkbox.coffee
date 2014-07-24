permissionCheckbox = Ember.Component.extend
  tagName: 'span'

  group: null
  extension: null
  blueprint: null
  action_type: 'view'

  type: (->
    if @get 'extension'
      return 'extension'
    else
      return 'blueprint'
  ).property 'extension', 'blueprint'

  resource: (->
    # if @get 'type' == 'extension'
    #   extension = @get 'extension'
    #   return extension.id
    # else
    #   blueprint = @get 'blueprint'

    "DERP"
  ).property 'extension', 'blueprint'

  permission: (->
    permission = @get('group').store.createRecord 'permission'

    permission.set 'is_allowed', false
    permission.set 'group', @get 'group'
    permission.set 'type', @get 'type'
    permission.set 'resource', @get 'resource'
    permission.set 'action', @get 'action_type'

    permission
  ).property 'group', 'type', 'resource', 'action_type'

  isAllowed: (->
    permission = @get 'permission'
    permission.get 'is_allowed'
  ).property 'permission'

  actions:
    allow: ->
      permission = @get 'permission'
      permission.set 'is_allowed', true
      permission.save()

    disallow: ->
      permission = @get 'permission'
      permission.set 'is_allowed', false
      permission.save()

`export default permissionCheckbox`
