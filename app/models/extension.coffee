Extension = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  blueprints: DS.hasMany 'blueprint', { async: true }

Extension.reopenClass
  FIXTURES: [
    { id: 1, name: 'Blog', slug: 'blog', blueprints: [1, 2] }
  ]

`export default Extension`
