Blueprint = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  extension: DS.belongsTo 'extension', async: true
  definition: DS.attr 'object'

Blueprint.reopenClass
  FIXTURES: [
    { id: 1, name: 'Post', slug: 'posts', extension: 'blog' }
    { id: 2, name: 'Comment', slug: 'comments', extension: 'blog' }
  ]

`export default Blueprint`
