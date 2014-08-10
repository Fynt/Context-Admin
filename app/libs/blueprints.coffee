Blueprints = Ember.Object.extend

  # Gets the type, or model name based on an extension id and bluerint slug.
  #
  # @param extension_id [String]
  # @param blueprint_slug [String]
  # @return [String]
  get_type: (extension_id, blueprint_slug) ->
    blueprint_slug = Ember.Inflector.inflector.singularize blueprint_slug
    "#{extension_id}/#{blueprint_slug}"

  # Gets a form config, which is used to render the form in the template based
  #   on the blueprint definition.
  #
  # @param blueprint [Blueprint] A blueprint model result.
  # @return [Array<Object>]
  get_form: (blueprint) ->
    form = []

    labelize = (s) ->
      s[0].toUpperCase() + s[1..-1].toLowerCase()

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

    form

`export default Blueprints`
