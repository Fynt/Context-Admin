Item = DS.Model.extend
  created_at: DS.attr 'date'
  blueprint: DS.belongsTo 'blueprint'

`export default Item`
