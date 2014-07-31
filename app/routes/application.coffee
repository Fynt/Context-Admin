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

`export default ApplicationRoute`
