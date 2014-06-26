LoginController = Ember.Controller.extend
  reset: ->
    # Clear some properties.
    @setProperties
      error: ''
      email: ''
      password: ''

  actions:
    close: ->
      @send 'closeModal'

    login: ->
      # Clear the previous error message if there are any.
      @set 'error', ''

      # Get the auth credentials.
      data = @getProperties 'email', 'password'

      Ember.$.post 'http://localhost:5000/user/login', data
      .done (data) =>
        if data and data.email?
          @session.setProperties data
          @session.set 'loggedIn', true

          @send 'closeModal'
      .fail (error) =>
        switch error.status
          when 400 then @set 'error', "Email and password are required."
          when 401 then @set 'error', "Authentication failed."

`export default LoginController`
