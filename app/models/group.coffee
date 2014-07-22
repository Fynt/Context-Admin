Group = DS.Model.extend
  label: DS.attr 'string'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'
  permission: DS.hasMany 'permission', async: true

  validations:
    label:
      presence: true
      length: minimum: 1

`export default Group`
