Item = DS.Model.extend
  created_at: DS.attr 'date'
  extension: DS.belongsTo 'extension'
  blueprint_name: DS.attr 'string'
  blueprint_slug: DS.attr 'string'

`export default Item`
