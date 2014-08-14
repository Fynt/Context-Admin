BlueprintItem = DS.Model.extend
  blueprint: DS.belongsTo 'blueprint'
  author: DS.belongsTo 'user'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'
  published: DS.attr 'boolean'

  validations:
    extension:
      presence: true
    blueprint_slug:
      presence: true

`export default BlueprintItem`
