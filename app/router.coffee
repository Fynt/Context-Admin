`import Ember from 'ember'`

Router = Ember.Router.extend
  location: ContextAdminENV.locationType
  rootURL: '/admin/'

Router.map ->
  @route 'login'

  @resource 'items', path: '/:extension/:blueprint_slug', ->
    @route 'update', path: ':id'
    @route 'create', path: 'create'

  @resource 'users', ->
    @route 'update', path: ':id'
    @route 'create'

  @resource 'groups', ->
    @route 'update', path: ':group_id'
    @route 'create'

  @resource 'permissions', path: '/permissions/:group_id'


  @route 'test-upload'

  return

`export default Router`
