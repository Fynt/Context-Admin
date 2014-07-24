permissionCheckbox = Ember.Component.extend
  tagName: 'span'

  group: null
  extension: null
  blueprint: null
  action_type: 'view'

  permission: (->
    permission = @get('group').store.createRecord 'permission'

    permission.set 'is_allowed', false
    permission.set 'group', @get 'group'

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
