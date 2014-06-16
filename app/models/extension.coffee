Extension = Ember.model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  blueprints: DS.hasMany 'blueprint'

Extension.reopenClass
  FIXTURES: [
    { name: 'Users', slug: 'users', blueprints: [] }
    { name: 'Pages', slug: 'pages', blueprints: [] }
    { name: 'Store', slug: 'store', blueprints: [] }
  ]

`export default Extension`