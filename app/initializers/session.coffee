`import Session from '../libs/session'`

SessionInitializer =
  name: 'session'
  after: 'jquery'

  initialize: (container, application) ->
    application.deferReadiness()

    application.register 'session:current', Session, singleton: true
    application.inject 'route', 'session', 'session:current'
    application.inject 'controller', 'session', 'session:current'

    Session.create().restore()
    .then (data) ->
      # Get the session data and apply it to the Session class.
      data['loggedIn'] = true
      Session.reopen data

      application.advanceReadiness()
    .catch ->
      application.advanceReadiness()

`export default SessionInitializer`
