Extension = DS.Model.extend
  name: DS.attr 'string'
  blueprints: DS.hasMany 'blueprint', { async: true }

Extension.reopenClass
  FIXTURES: [
    { id: 'blog', name: 'Blog', blueprints: [1, 2] }
  ]

`export default Extension`
