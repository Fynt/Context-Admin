Session = Ember.Object.extend
  loggedIn: false

  login: (email, password) ->
    new Promise (resolve, reject) =>
      Ember.$.ajax
        type: 'POST'
        url: 'http://localhost:5000/user/login',
        data:
          email: email
          password: password
        xhrFields:
          withCredentials: true
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
        xhrFields:
          withCredentials: true
      .done (data) =>
        if data and data.email?
          @setProperties data
          @set 'loggedIn', true

        resolve data
      .fail (error) ->
        reject error

`export default Session`
