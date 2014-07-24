permissionCheckbox = Ember.Component.extend
  tagName: 'span'

  group: null
  extension: null
  blueprint: null
  action_type: 'view'

  type: ->
    if @get 'extension'
      return 'extension'
    else
      return 'blueprint'

  resource: ->
    if @type() == 'extension'
      extension = @get 'extension'

      return extension.get 'id'
    else
      blueprint = @get 'blueprint'
      extension = blueprint.get 'extension'

      extension_id = extension.id
      blueprint_name = blueprint.get 'name'

      return "#{extension_id}:#{blueprint_name}"

  permission: (->
    permission = @get('group').store.createRecord 'permission'

    permission.set 'is_allowed', false
    permission.set 'group', @get 'group'
    permission.set 'type', @type()
    permission.set 'resource', @resource()
    permission.set 'action', @get 'action_type'

    permission
  ).property 'group', 'extension', 'blueprint', 'action_type'

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
