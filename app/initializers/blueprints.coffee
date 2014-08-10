`import Blueprints from '../libs/blueprints'`
`import BlueprintItem from '../libs/blueprint-item'`


BlueprintsInitializer =
  name: 'blueprints'
  after: 'jquery'

  initialize: (container, application) ->
    # Gets a model instance which has additional attributes based on the
    #   blueprint definition.
    #
    # @param blueprint [Blueprint] A blueprint model result.
    # @return [Promise]
    create_model = (blueprint) ->
      # model = BlueprintItem
      # attributes = {}
      #
      # for field of blueprint.definition
      #   options = definition[field]
      #
      #   if options.type?
      #     #TODO Make this more dynamic.
      #     attributes[field] = DS.attr 'string'
      #
      # model.reopen attributes
      # model
      DS.Model

    store = container.lookup 'store:main'
    store.find 'blueprint'
    .then (blueprints) ->
      blueprints.forEach (blueprint) ->
        extension_id = blueprint.get('extension').id
        blueprint_slug = blueprint.get 'slug'

        model_name = "#{extension_id}/#{blueprint_slug}"
        model = create_model blueprint

        application.register "model:#{model_name}", model

    # Register blueprints
    application.register 'blueprints:current', Blueprints, singleton: true
    application.inject 'route', 'blueprints', 'blueprints:current'
    application.inject 'controller', 'blueprints', 'blueprints:current'

`export default BlueprintsInitializer`
