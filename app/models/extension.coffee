Extension = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  blueprints: DS.hasMany 'blueprint'


Extension.reopenClass
  FIXTURES: [
    { id: 1, name: 'Users', slug: 'users', blueprints: [1, 2] }
    { id: 3, name: 'Store', slug: 'store', blueprints: [3, 4] }
  ]

`export default Extension`