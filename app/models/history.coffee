History = DS.Model.extend
  author: DS.belongsTo 'user'
  action: DS.attr 'string'
  #data: DS.belongsTo 'item'
  created_at: DS.attr 'date'

`export default History`
