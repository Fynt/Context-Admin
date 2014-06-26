`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

#TODO There has to be a better place to define this.
Session = Ember.Object.extend
  loggedIn: false

App = Ember.Application.extend
  modulePrefix: 'context-admin' # TODO: loaded via config
  Resolver: Resolver

  ready: ->
    @register 'session:current', Session, singleton: true
    @inject 'controller', 'session', 'session:current'
    @inject 'route', 'session', 'session:current'

loadInitializers App, 'context-admin'

`export default App`
