`import Ember from "ember"`
Session = Ember.Object.extend

  # @property [Boolean]
  loggedIn: false

  # @property [Object]
  failedTransition: null

  # Creates a user session on the server if successful.
  #
  # @param email [String]
  # @param password [String]
  # @return [Promise]
  login: (email, password) ->
    new Ember.RSVP.Promise (resolve, reject) =>
      Ember.$.ajax
        type: 'POST'
        url: 'http://localhost:5000/user/login'
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

  # Logs the user out by destroying the session.
  #
  # @return [Promise]
  logout: ->
    @set 'loggedIn', false

    Ember.$.ajax
      type: 'GET'
      url: 'http://localhost:5000/user/logout'

  # Used to restore the session data after a page refresh, etc.
  #
  # @return [Promise]
  restore: ->
    new Ember.RSVP.Promise (resolve, reject) =>
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
