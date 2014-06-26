ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      @session.set 'loggedIn', false
      @controllerFor('login').reset()

    openModal: (modalName) ->
      @render modalName,
        into: 'application'
        outlet: 'modal'

    closeModal: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

`export default ApplicationRoute`
