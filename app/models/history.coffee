History = DS.Model.extend
  author: DS.belongsTo 'user'
  action: DS.attr 'string'
  extension: DS.attr 'string'
  blueprint_slug: DS.attr 'string'
  blueprint_name: DS.attr 'string'
  data_id: DS.attr 'number'
  created_at: DS.attr 'date'

`export default History`
