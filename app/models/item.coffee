Item = DS.Model.extend
  created_at: DS.attr 'date'
  extension: DS.belongsTo 'extension'
  blueprint_name: DS.attr 'string'
  blueprint_slug: DS.attr 'string'

Item.reopenClass
  FIXTURES: [
    { id: 1, extension: 1, blueprint_name: 'blog', blueprint_slug: 'blog' }
  ]

`export default Item`
