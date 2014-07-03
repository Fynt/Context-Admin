`import Ember from 'ember';`

RenderComponent = Ember.Handlebars.makeBoundHelper (value, options) ->
  console.log options.hash

  value

`export default RenderComponent`
