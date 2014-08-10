History = DS.Model.extend
  author: DS.belongsTo 'user'
  action: DS.attr 'string'
  #TODO This needs to be updated since there's no longer an item.
  #item: DS.belongsTo 'item', async: true
  created_at: DS.attr 'date'

History.reopenClass
  FIXTURES: [
    { id: 1, author: 1, action: 'Ate a big pizza.', created_at: '2014-01-01' }
    { id: 2, author: 1, action: 'Felt real full.', created_at: '2014-01-01' }
  ]

`export default History`
