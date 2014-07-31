ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    if not @session.loggedIn
      #TODO THIS CAUSES A CORS ERROR AND I HAVE NO IDEA WHY.
      @transitionToRoute 'login'

  actions:
    logout: ->
      @session.logout()

      # Reset both of the login controllers.
      @controllerFor('login').reset()
      @controllerFor('login-modal').reset()

    openModal: (modalName) ->
      @render modalName,
        into: 'application'
        outlet: 'modal'

    closeModal: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

`export default ApplicationRoute`
