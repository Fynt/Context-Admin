Permission = DS.Model.extend
  group: DS.belongsTo 'group'
  action: DS.attr 'string'
  is_allowed: DS.attr 'boolean'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'

`export default Permission`
