Router = Ember.Router.extend
  location: EmberENV.locationType
  rootURL: '/admin/'

Router.map ->
  @route 'item-index', path: '/:extension_slug/:blueprint_slug'
  @route 'item-create', path: '/:extension_slug/:blueprint_slug/create'
  @route 'item-update', path: '/:extension_slug/:blueprint_slug/:id'

  return

`export default Router`
