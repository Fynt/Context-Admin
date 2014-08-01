ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    if not @session.loggedIn
      @transitionTo 'login'

  actions:
    logout: ->
      # Reset both of the login controllers.
      @controllerFor('login').reset()
      @controllerFor('login-modal').reset()

      @session.logout().then =>
        @transitionTo 'login'

    openModal: (modalName) ->
      @render modalName,
        into: 'application'
        outlet: 'modal'

    closeModal: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

    error: (reasons, transition) ->
      if reasons.status == 401
        @session.set 'transition', transition

        try
          # Trigger the login modal.
          @render 'login-modal',
            into: 'application'
            outlet: 'modal'
        catch e
          # The app might not be initialized yet, so try and transition to the
          # login screen.
          @transitionTo 'login'

`export default ApplicationRoute`
