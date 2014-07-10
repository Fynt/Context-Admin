Router = Ember.Router.extend
  location: EmberENV.locationType
  rootURL: '/admin/'

Router.map ->
  #@resource 'extension', { path: '/:slug' }
  #@resource 'blueprint', { path: '/:slug/:blueprint' }

  @route 'create-item', path: '/:extension_slug/:blueprint_slug/create'
  @route 'update-item', path: '/:extension_slug/:blueprint_slug/:id'

  return

`export default Router`
