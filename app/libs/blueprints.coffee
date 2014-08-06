Blueprints = Ember.Object.extend

  # @private
  # @property [Array<Object>]
  _extensions: null

  # @private
  # @property [Object]
  _definitions: {}

  # @return [Promise]
  extensions: ->
    new Promise (resolve, reject) =>
      if @_extensions
        resolve @_extensions
      else
        @_load_extensions().then (extensions) =>
          @_extensions = extensions
          resolve @_extensions
        , (error) ->
          reject error

  # Gets a definition, which can be used to generate a model or a form.
  #
  # @param extension [String] The slug name of the extension.
  # @param blueprint [String] The slug name of the blueprint.
  # @return [Promise]
  definition: (extension, blueprint) ->
    new Promise (resolve, reject) =>
      key = "#{extension}:#{blueprint}"

      if not @_definitions[key]?
        @_load_definition extension, blueprint
        .then (definition) =>
          @_definitions[key] = definition
          resolve definition
        , (error) ->
          reject error
      else
        resolve @_definitions[key]

  # Gets a form config, which is used to render the form in the template based
  #   on the blueprint definition.
  #
  # @param extension [String] The slug name of the extension.
  # @param blueprint [String] The slug name of the blueprint.
  # @return [Promise]
  get_form: (extension, blueprint) ->
    form = []

    labelize = (s) ->
      s[0].toUpperCase() + s[1..-1].toLowerCase()

    new Promise (resolve, reject) =>
      @definition extension, blueprint
      .then (definition) ->
        for field of definition
          options = definition[field]

          if options.type?
            form.push
              field: field
              type: options.type
              label: labelize field

          if options.belongs_to?
            form.push
              field: field
              type: 'belongs_to'
              label: labelize field

        resolve form
      , (error) ->
        reject error

  # Gets a model instance which has additional attributes based on the blueprint
  #   definition.
  #
  # @param model [DS.Model] The base model to add attributes to.
  # @param extension [String] The slug name of the extension.
  # @param blueprint [String] The slug name of the blueprint.
  # @return [Promise]
  get_item: (model, extension, blueprint) ->
    attributes = {}

    new Promise (resolve, reject) =>
      @definition extension, blueprint
      .then (definition) ->
        for field of definition
          options = definition[field]

          if options.type?
            #TODO Make this more dynamic.
            attributes[field] = DS.attr 'string'

        model.reopen attributes
        resolve model

  # Loads the extensions from the server.
  #
  # @private
  # @return [Promise]
  _load_extensions: ->
    Ember.$.ajax
      url: 'http://localhost:5000/extensions'

  # Loads a definition from the server based on extension and blueprint.
  #
  # @private
  # @param extension [String]
  # @param blueprint [String]
  # @return [Promise]
  _load_definition: (extension, blueprint) ->
    if not extension? or not blueprint?
      throw new Error "You need to specify an extension and blueprint."

    Ember.$.ajax
      url: "http://localhost:5000/#{extension}/#{blueprint}/definition"

`export default Blueprints`
