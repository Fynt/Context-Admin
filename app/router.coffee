Router = Ember.Router.extend
  location: ENV.locationType
  rootURL: '/admin/'

Router.map ->
  @resource 'extension', { path: '/:extension' }
  @resource 'blueprint', { path: '/:extension/:blueprint' }
  return

`export default Router`