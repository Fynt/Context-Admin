LoginController = Ember.Controller.extend

  reset: ->
    # Clear some properties.
    @setProperties
      error: ''
      email: ''
      password: ''

  actions:

    login: ->
      # Clear the previous error message if there are any.
      @set 'error', ''

      @session.login @get('email'), @get('password')
      .then (data) =>
        @transitionTo 'application'
      , (error) =>
        switch error.status
          when 400 then @set 'error', "Email and password are required."
          when 401 then @set 'error', "Authentication failed."

`export default LoginController`
