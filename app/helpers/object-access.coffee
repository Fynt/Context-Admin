ObjectAccess = Ember.Handlebars.makeBoundHelper (object, key) ->
  object.get key if object

`export default ObjectAccess`
