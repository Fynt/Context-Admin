Session = Ember.Object.extend

  # @property [Boolean]
  loggedIn: false

  login: (email, password) ->
    new Promise (resolve, reject) =>
      Ember.$.ajax
        type: 'POST'
        url: 'http://localhost:5000/user/login',
        data:
          email: email
          password: password
      .done (data) =>
        if data and data.email?
          @setProperties data
          @set 'loggedIn', true

        resolve data
      .fail (error) ->
        reject error

  restore: ->
    new Promise (resolve, reject) =>
      Ember.$.ajax
        type: 'GET'
        url: 'http://localhost:5000/user/session'
      .done (data) =>
        if data and data.email?
          @setProperties data
          @set 'loggedIn', true

        resolve data
      .fail (error) ->
        reject error

`export default Session`
