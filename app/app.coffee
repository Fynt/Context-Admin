`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: 'context-admin' # TODO: loaded via config
  Resolver: Resolver

loadInitializers App, 'context-admin'

`export default App`
