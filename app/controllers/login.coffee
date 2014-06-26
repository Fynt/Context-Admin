LoginController = Ember.Controller.extend
  error: ""

  actions:
    close: ->
      @send 'closeModal'

    login: ->
      # Clear the previous error message if there are any.
      @set 'error', ''

      data =
        email: @get 'email'
        password: @get 'password'

      Ember.$.post 'http://localhost:5000/user/login', data
      .done (data) =>
        @session.set 'loggedIn', true
        @send 'closeModal'
      .fail (error) =>
        switch error.status
          when 400 then @set 'error', "Email and password are required."
          when 401 then @set 'error', "Authentication failed."

`export default LoginController`
