`import DS from 'ember-data'`
Permission = DS.Model.extend
  group: DS.belongsTo 'group'
  type: DS.attr 'string'
  resource: DS.attr 'string'
  action: DS.attr 'string'
  is_allowed: DS.attr 'boolean'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'

`export default Permission`
