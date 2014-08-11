`import Blueprints from '../libs/blueprints'`
`import BlueprintItem from '../libs/blueprint-item'`


BlueprintsInitializer =
  name: 'blueprints'
  after: 'jquery'

  initialize: (container, application) ->
    # We're going to need this for the model_type_name function.
    blueprints = new Blueprints
    model_type_name = (blueprint, blueprint_slug) ->
      extension_id = blueprint.get('extension').id
      if not blueprint_slug?
        blueprint_slug = blueprint.get 'slug'

      blueprints.get_type extension_id, blueprint_slug

    # Gets a model instance which has additional attributes based on the
    #   blueprint definition.
    #
    # @param blueprint [Blueprint] A blueprint model result.
    # @return [Promise]
    create_model = (blueprint) ->
      model = BlueprintItem
      attributes = {}

      definition = blueprint.get 'definition'
      for field of definition
        options = definition[field]

        if options.type?
          #TODO Make this more dynamic.
          attributes[field] = DS.attr 'string'
        else if options.belongs_to?
          model_name = model_type_name blueprint, options.belongs_to
          attributes[field] = DS.belongsTo model_name

      model.reopen attributes
      model

    store = container.lookup 'store:main'
    store.find 'blueprint'
    .then (blueprints) ->
      blueprints.forEach (blueprint) ->
        # Create the actual model and register it.
        model = create_model blueprint
        model_name = model_type_name blueprint
        application.register "model:#{model_name}", model

    # Register blueprints
    application.register 'blueprints:current', Blueprints, singleton: true
    application.inject 'route', 'blueprints', 'blueprints:current'
    application.inject 'controller', 'blueprints', 'blueprints:current'

`export default BlueprintsInitializer`
