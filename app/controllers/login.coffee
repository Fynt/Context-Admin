LoginController = Ember.Controller.extend
  actions:
    close: ->
      @send 'closeModal'

    login: ->
      data =
        email: @get 'email'
        password: @get 'password'

      Ember.$.post 'http://localhost:5000/login', data
      .done (data) ->
        @session.set 'loggedIn', true
        @send 'closeModal'
      .catch (error) ->
        console.log error

`export default LoginController`
