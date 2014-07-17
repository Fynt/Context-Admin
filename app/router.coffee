Router = Ember.Router.extend
  location: 'history'
  rootURL: '/admin/'

Router.map ->
  @route 'item-index', path: '/:extension_slug/:blueprint_slug'
  @route 'item-create', path: '/:extension_slug/:blueprint_slug/create'
  @route 'item-update', path: '/:extension_slug/:blueprint_slug/:id'

  @resource 'users', ->
    @route 'update', path: ':id'
    @route 'create'

  @resource 'groups', ->
    @route 'update', path: ':group_id'
    @route 'create'

  return

`export default Router`
