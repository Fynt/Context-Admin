`import Ember from 'ember';`

BlueprintInput = Ember.Handlebars.makeBoundHelper (type, options) ->
  switch type
    when 'richtext' then component_name = 'em-text'
    else component_name = 'em-input'

  Ember.Handlebars.helpers[component_name].call @, options

`export default BlueprintInput`
