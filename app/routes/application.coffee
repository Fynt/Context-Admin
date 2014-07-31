ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    if not @session.loggedIn
      @transitionTo 'login'

  actions:
    logout: ->
      @session.logout()
      @controllerFor('login').reset()

    openModal: (modalName) ->
      @render modalName,
        into: 'application'
        outlet: 'modal'

    closeModal: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

    error: (err) ->
      console.log err

`export default ApplicationRoute`
