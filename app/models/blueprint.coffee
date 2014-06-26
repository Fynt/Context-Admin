Blueprint = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  extension: DS.belongsTo 'extension'

Blueprint.reopenClass
  FIXTURES: [
    { id: 1, name: 'Users', slug: 'users' }
    { id: 2, name: 'Groups', slug: 'groups' }
    { id: 3, name: 'Products', slug: 'products' }
    { id: 4, name: 'Orders', slug: 'orders' }
  ]

`export default Blueprint`
