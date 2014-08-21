`import Ember from "ember"`
`import DS from 'ember-data'`
Blueprints = Ember.Object.extend

  # Gets the type, or model name based on an extension id and bluerint slug.
  #
  # @param extension_id [String]
  # @param blueprint_slug [String]
  # @return [String]
  get_type: (extension_id, blueprint_slug) ->
    blueprint_slug = blueprint_slug.toLowerCase()
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

    definition = blueprint.get 'definition'
    for field of definition
      field_definition = definition[field]
      field_options = definition[field].options || {}

      console.log field_options

      if field_options.label?
        field_label = field_options.label
      else
        field_label = labelize field

      if field_definition.type?
        form.push
          field: field
          type: field_definition.type
          label: field_label

      if field_definition.belongs_to?
        form.push
          field: field
          type: 'belongs_to'
          label: field_label

    form

`export default Blueprints`
