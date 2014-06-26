ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      @session.set 'loggedIn', false

    openModal: (modalName) ->
      @render modalName,
        into: 'application'
        outlet: 'modal'

    closeModal: ->
      @disconnectOutlet
        outlet: 'modal'
        parentView: 'application'

`export default ApplicationRoute`
