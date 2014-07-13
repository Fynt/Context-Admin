Blueprint = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  extension: DS.belongsTo 'extension'

Blueprint.reopenClass
  FIXTURES: [
    { id: 1, name: 'Post', slug: 'posts' }
    { id: 2, name: 'Comment', slug: 'comments' }
  ]

`export default Blueprint`
