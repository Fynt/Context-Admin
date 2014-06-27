Router = Ember.Router.extend
  location: EmberENV.locationType
  rootURL: '/admin/'

Router.map ->
  @resource 'extension', { path: '/:slug' }
  @resource 'blueprint', { path: '/:slug/:blueprint' }
  return

`export default Router`
