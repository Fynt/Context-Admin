`import Blueprints from '../libs/blueprints'`

BlueprintsInitializer =
  name: 'blueprints'
  after: 'jquery'

  initialize: (container, application) ->
    Test = DS.Model.extend
      lol: DS.attr 'string'
    application.register 'model:test', Test

    # Register blueprints
    application.register 'blueprints:current', Blueprints, singleton: true
    application.inject 'route', 'blueprints', 'blueprints:current'
    application.inject 'controller', 'blueprints', 'blueprints:current'

`export default BlueprintsInitializer`
