User = DS.Model.extend
  group: DS.belongsTo 'group'
  email: DS.attr 'string'
  password: DS.attr 'string'
  last_login: DS.attr 'date'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'

`export default User`
