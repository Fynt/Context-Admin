# Gives us a way to load components dynamically.
# @see http://stackoverflow.com/questions/18972202/how-can-i-invoke-an-ember-component-dynamically-via-a-variable
BlueprintInput = Ember.Handlebars.makeBoundHelper (type, options) ->
  switch type
    when 'richtext' then component_name = 'text'
    when 'belongs_to' then component_name = 'select'
    else component_name = 'input'

  Ember.Handlebars.helpers["em-#{component_name}"].call @, options

`export default BlueprintInput`
