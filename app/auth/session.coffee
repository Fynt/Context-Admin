Session = Ember.Object.extend
  loggedIn: false

  login: (email, password) ->
    new Promise (resolve, reject) =>
      Ember.$.post 'http://localhost:5000/user/login',
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
      Ember.$.get 'http://localhost:5000/user/session'
      .done (data) =>
        if data and data.email?
          @setProperties data
          @set 'loggedIn', true

        resolve data
      .fail (error) ->
        reject error

`export default Session`
