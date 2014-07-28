permissionCheckbox = Ember.Component.extend
  tagName: 'span'

  group: null
  permissions: null
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

  create_permission: ->
    group = @get 'group'
    permission = group.store.createRecord 'permission'

    permission.set 'is_allowed', false
    permission.set 'group', group
    permission.set 'type', @type()
    permission.set 'resource', @resource()
    permission.set 'action', @get 'action_type'

    permission

  find_permission: ->
    group = @get 'group'
    result = null

    group.get('permissions').forEach (permission) =>
      # Converting to simple Object to get around getter errors.
      p = permission.toJSON()
      if p.type == @type()
        if p.action == @get 'action_type'
          if p.resource == @resource()
            result = permission

    return result

  permission: (->
    permission = @find_permission()
    if permission? and permission
      return permission
    else
      return @create_permission()
  ).property 'group', 'extension', 'blueprint', 'action_type'

  action_label: (->
    action_type = @get 'action_type'
    label = ''

    switch action_type
      when 'save' then label = 'Save & Create'
      else
        label = action_type[0].toUpperCase() + action_type[1..-1].toLowerCase()

    label
  ).property 'action_type'

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
