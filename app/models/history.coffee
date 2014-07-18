History = DS.Model.extend
  author: DS.belongsTo 'user'
  action: DS.attr 'string'
  item: DS.belongsTo 'item'
  created_at: DS.attr 'date'

History.reopenClass
  FIXTURES: [
    { id: 1, author: 1, action: 'Ate a big pizza.', item: 1, created_at: '2014-01-01' }
    { id: 2, author: 1, action: 'Felt real full.', item: 1, created_at: '2014-01-01' }
  ]

`export default History`
