permissionCheckbox = Ember.Component.extend
  tagName: 'span'

  group: null
  extension: null
  blueprint: null
  action_type: 'view'

  isAllowed: (->
    true
  ).property 'group', 'extension', 'blueprint', 'action_type'

  actions:
    allow: ->
      alert "allowed"

    disallow: ->
      alert "not allowed"

`export default permissionCheckbox`
