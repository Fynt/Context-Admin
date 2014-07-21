User = DS.Model.extend
  group: DS.belongsTo 'group'
  email: DS.attr 'string'
  name: DS.attr 'string'
  password: DS.attr 'string'
  verify_pass: DS.attr 'string'
  last_login: DS.attr 'date'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'

  email_hash: (->
    md5 @get("email")
  ).property("email")

  validations:
    email:
      presence: true
      length: minimum: 4

User.reopenClass
  FIXTURES: [
    { id: 1, group: 1, email: 'ryan@fynt.ca', name: 'Ryan', last_login: '2014-01-01', 'created_at': '2014-01-01', 'updated_at': '2014-01-01' }
    { id: 2, group: 1, email: 'keith@fynt.ca', name: 'Keith', last_login: '2014-01-01', 'created_at': '2014-01-01', 'updated_at': '2014-01-01' }
  ]

`export default User`
