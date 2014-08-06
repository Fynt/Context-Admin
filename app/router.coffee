Router = Ember.Router.extend
  location: 'history'
  rootURL: '/admin/'

Router.map ->
  @route 'login'

  @route 'items', path: '/:extension_slug/:blueprint_slug', ->
    @route 'update', path: ':id'
    @route 'create', path: 'create'

  @resource 'users', ->
    @route 'update', path: ':id'
    @route 'create'

  @resource 'groups', ->
    @route 'update', path: ':group_id'
    @route 'create'

  @resource 'permissions', path: '/permissions/:group_id'

  return

`export default Router`
