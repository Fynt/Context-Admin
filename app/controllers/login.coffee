LoginController = Ember.Controller.extend Em.I18n.TranslateableProperties,
  
  headingTranslation: 'auth.login.heading'
  errorInvalidTranslation: 'auth.login.errors.invalid'
  errorFailedTranslation: 'auth.login.errors.failed'
  
  panelHeading: ( ->
    heading = ''
    error = @get 'error'
    heading += error if (error) 
    heading
  ).property 'error', 'heading'
  
  panelType: ( ->
    error = @get 'error' 
    if error then 'danger' else 'default'
  ).property 'error'
  
  emailHash: ( ->
    md5 @get("email")
  ).property 'email'
  
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
        # Attempt failed transition if it exists.
        if @session.failedTransition
          # Retry the failed transition and then reset it.
          @session.failedTransition.retry()
          @session.failedTransition = null
        else
          # Default back to homepage
          @transitionTo 'application'
      , (error) =>
        switch error.status
          when 400 then @set 'error', @get 'errorInvalid'
          when 401 then @set 'error', @get 'errorFailed'

`export default LoginController`
