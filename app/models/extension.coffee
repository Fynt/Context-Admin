Extension = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  #blueprints: DS.hasMany 'blueprint'


Extension.reopenClass
  FIXTURES: [
    { id: 1, name: 'Users', slug: 'users', blueprints: [] }
    { id: 2, name: 'Pages', slug: 'pages', blueprints: [] }
    { id: 3, name: 'Store', slug: 'store', blueprints: [] }
  ]

`export default Extension`