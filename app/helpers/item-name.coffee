`import Ember from "ember"`

ItemName = Ember.Handlebars.makeBoundHelper (item) ->
  name = item.get 'id'
  if item.get 'name' then name = item.get 'name'
  if item.get 'title' then name = item.get 'title'
  name

`export default ItemName`
